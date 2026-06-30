import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../core/di/di_setup.dart';
import 'dough_screen.dart';
import 'dough_state.dart';
import 'dough_view_model.dart';

class DoughRoot extends StatefulWidget {
  const DoughRoot({super.key});

  @override
  State<DoughRoot> createState() => _DoughRootState();
}

class _DoughRootState extends State<DoughRoot> {
  late final DoughViewModel _viewModel = getIt<DoughViewModel>();

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DoughState>(
      valueListenable: _viewModel,
      builder: (context, state, child) {
        return DoughScreen(
          state: state,
          onIntent: _viewModel.onIntent,
        );
      },
    );
  }
}
