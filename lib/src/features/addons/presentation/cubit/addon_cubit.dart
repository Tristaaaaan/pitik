import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pitik/src/common/state/read_state.dart';
import 'package:pitik/src/features/addons/domain/entity/addon_entity.dart';
import 'package:pitik/src/features/addons/domain/usecase/create_addon_usecase.dart';
import 'package:pitik/src/features/addons/domain/usecase/delete_addon_usecase.dart';
import 'package:pitik/src/features/addons/domain/usecase/read_addon_usecase.dart';

import '../../../../core/usecase/usecase.dart';

class AddOnCubit extends Cubit<ReadState> {
  final CreateAddOn createAddOnUseCase;
  final ReadAddOn readAddOnUseCase;
  final DeleteAddOn deleteAddOnUseCase;
  AddOnCubit({
    required this.createAddOnUseCase,
    required this.deleteAddOnUseCase,
    required this.readAddOnUseCase,
  }) : super(const ReadState.initial()) {
    fetchInitial();
  }

  static const pageSize = 25;

  int _offset = 0;
  bool _hasMore = true;
  bool _isLoading = false;
  String _searchQuery = '';

  final List<AddOnEntity> _items = [];

  bool get isLoadingMore => _isLoading;

  Future<void> fetchInitial() async {
    if (_isLoading) return;

    _offset = 0;
    _items.clear();
    _hasMore = true;

    emit(const ReadState.loading());
    await _load();
  }

  Future<void> search(String query) async {
    if (_searchQuery == query) return;

    _searchQuery = query;

    _offset = 0;
    _items.clear();
    _hasMore = true;
    emit(const ReadState.loading());
    await _load();
  }

  Future<void> _load() async {
    if (isClosed) return;

    _isLoading = true;

    final either = await readAddOnUseCase(
      ReadPackagesParams(offset: _offset, searchQuery: _searchQuery),
    ).run();

    if (isClosed) return;

    either.fold(
      (failure) {
        _isLoading = false;
        emit(ReadState.error(failure.message ?? failure.toString()));
      },
      (data) {
        _hasMore = data.isNotEmpty && data.length == pageSize;

        if (data.isNotEmpty) {
          _offset += data.length;
          _items.addAll(data);
        }

        emit(
          _items.isEmpty
              ? const ReadState.empty()
              : ReadState.loaded(List.unmodifiable(_items), _hasMore),
        );

        _isLoading = false;
      },
    );
  }

  Future<void> loadMore() async {
    if (!_hasMore || _isLoading) return;

    developer.log("searchQuery: $_searchQuery");
    await _load();
  }

  Future<void> createAddOn(AddOnEntity reagent) async {
    await createAddOnUseCase(reagent).run();
    await refresh();
  }

  Future<void> deleteAddOn(String id) async {
    await deleteAddOnUseCase(id).run();
    await refresh();
  }

  Future<void> refresh() async {
    if (isClosed) return;
    _searchQuery = '';
    _isLoading = false;
    _offset = 0;
    _items.clear();
    _hasMore = true;

    emit(const ReadState.loading());
    await _load();
  }
}
