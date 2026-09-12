// add_on_container.dart — corrected to use the shared cubit, not a local one
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pitik/src/features/addons/domain/entity/addon_entity.dart';
import 'package:pitik/src/features/addons/presentation/cubit/addon_selection_cubit.dart';
import 'package:pitik/src/features/addons/presentation/cubit/addon_selection_state.dart';

import '../../../../../core/design/design_tokens.dart';
import '../../../../package/presentation/widget/regular_text.dart';

class AddOnContainer extends StatefulWidget {
  final AddOnEntity addOn;

  const AddOnContainer({super.key, required this.addOn});

  @override
  State<AddOnContainer> createState() => _AddOnContainerState();
}

class _AddOnContainerState extends State<AddOnContainer> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: '0');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _syncController(int value) {
    final text = value.toString();
    if (_controller.text != text) {
      _controller.value = _controller.value.copyWith(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOnSelectionCubit, AddOnSelectionState>(
      listenWhen: (a, b) =>
          a.valueFor(widget.addOn) != b.valueFor(widget.addOn),
      listener: (context, state) =>
          _syncController(state.valueFor(widget.addOn)),
      buildWhen: (a, b) => a.valueFor(widget.addOn) != b.valueFor(widget.addOn),
      builder: (context, state) {
        final cubit = context.read<AddOnSelectionCubit>();
        final value = state.valueFor(widget.addOn);

        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RegularText(
                      text: widget.addOn.title ?? '',
                      fontSize: AppTextSize.md,
                    ),
                    if ((widget.addOn.description ?? '').isNotEmpty) ...[
                      SizedBox(height: AppSpacing.xs),
                      RegularText(
                        text: widget.addOn.description!,
                        fontSize: AppTextSize.sm,
                        color: AppColors.textSecondary,
                      ),
                    ],
                  ],
                ),
              ),
              SizedBox(width: AppSpacing.md),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove, size: AppIconSize.sm),
                    onPressed: value <= 0
                        ? null
                        : () => cubit.decrement(widget.addOn),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    color: AppColors.textSecondary,
                  ),
                  SizedBox(width: AppSpacing.xs),
                  SizedBox(
                    width: 56,
                    child: TextField(
                      controller: _controller,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: AppSpacing.xs,
                          horizontal: AppSpacing.sm,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppRadius.sm),
                        ),
                      ),
                      onChanged: (text) {
                        final parsed = int.tryParse(text) ?? 0;
                        cubit.setValue(widget.addOn, parsed);
                      },
                    ),
                  ),
                  SizedBox(width: AppSpacing.xs),
                  IconButton(
                    icon: Icon(Icons.add, size: AppIconSize.sm),
                    onPressed: () => cubit.increment(widget.addOn),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
