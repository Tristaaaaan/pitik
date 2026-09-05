import 'package:flutter_bloc/flutter_bloc.dart';

class RegularButtonLoadingCubit extends Cubit<Map<String, bool>> {
  RegularButtonLoadingCubit() : super({});

  void setLoading(String buttonKey, bool isLoading) {
    emit({...state, buttonKey: isLoading});
  }

  bool isLoading(String key) => state[key] ?? false;
}
