import 'package:freezed_annotation/freezed_annotation.dart';

part 'read_state.freezed.dart';

@freezed
class ReadState<T> with _$ReadState<T> {
  const factory ReadState.initial() = _Initial<T>;
  const factory ReadState.loading() = _Loading<T>;
  const factory ReadState.loaded(T data, bool hasMore) = _Loaded<T>;
  const factory ReadState.error(String message) = _Error<T>;
  const factory ReadState.empty() = _Empty<T>;
}
