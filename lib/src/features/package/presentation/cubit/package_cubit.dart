import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/usecase/create_package_usecase.dart';
import '../../domain/usecase/read_package_usecase.dart';
import '../../entities/package_entity.dart';
import 'package_state.dart';

class PackageCubit extends Cubit<PackageState> {
  final CreatePackage createPackageUseCase;
  final ReadPackage readPackageUseCase;
  PackageCubit({
    required this.createPackageUseCase,
    required this.readPackageUseCase,
  }) : super(const PackageState.initial()) {
    fetchInitial();
  }

  static const pageSize = 25;

  int _offset = 0;
  bool _hasMore = true;
  bool _isLoading = false;
  String _searchQuery = '';

  final List<PackageEntity> _items = [];

  bool get isLoadingMore => _isLoading;

  Future<void> fetchInitial() async {
    if (_isLoading) return;

    _offset = 0;
    _items.clear();
    _hasMore = true;

    emit(const PackageState.loading());
    await _load();
  }

  Future<void> search(String query) async {
    if (_searchQuery == query) return;

    _searchQuery = query;

    _offset = 0;
    _items.clear();
    _hasMore = true;
    emit(const PackageState.loading());
    await _load();
  }

  Future<void> _load() async {
    if (isClosed) return;

    _isLoading = true;

    final either = await readPackageUseCase(
      ReadPackagesParams(offset: _offset, searchQuery: _searchQuery),
    ).run();

    if (isClosed) return;

    either.fold(
      (failure) {
        _isLoading = false;
        emit(PackageState.error(failure.message ?? failure.toString()));
      },
      (data) {
        _hasMore = data.isNotEmpty && data.length == pageSize;

        if (data.isNotEmpty) {
          _offset += data.length;
          _items.addAll(data);
        }

        emit(
          _items.isEmpty
              ? const PackageState.empty()
              : PackageState.loaded(List.unmodifiable(_items), _hasMore),
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

  Future<void> createPackage(PackageEntity reagent) async {
    await createPackageUseCase(reagent).run();
    await refresh();
  }

  Future<void> refresh() async {
    if (isClosed) return;
    _searchQuery = '';
    _isLoading = false;
    _offset = 0;
    _items.clear();
    _hasMore = true;

    emit(const PackageState.loading());
    await _load();
  }
}
