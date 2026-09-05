import 'package:freezed_annotation/freezed_annotation.dart';

import '../../entities/package_entity.dart';

part 'package_state.freezed.dart';

@freezed
class PackageState with _$PackageState {
  const factory PackageState.initial() = _Initial;
  const factory PackageState.loading() = _Loading;
  const factory PackageState.loaded(
    List<PackageEntity>? package,
    bool hasMore,
  ) = _Loaded;
  const factory PackageState.error(String message) = _Error;
  const factory PackageState.empty() = _Empty;
}
