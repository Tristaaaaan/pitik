import 'dart:developer' as developer;

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package_cubit.dart';

class ReagentScrollCubit extends Cubit<void> {
  ReagentScrollCubit() : super(null);

  bool _triggered = false;
  void onScroll(ScrollController controller, BuildContext context) {
    if (!controller.hasClients) return;

    final max = controller.position.maxScrollExtent;
    final current = controller.position.pixels;

    // Trigger slightly before reaching the end
    if (current >= max - 50 && !_triggered) {
      _triggered = true;
      developer.log('Loading more items');
      context.read<PackageCubit>().loadMore();
    }

    // Reset trigger when user scrolls up far enough
    if (current < max - 300) {
      _triggered = false;
    }
  }
}
