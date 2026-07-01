import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../core/di/di_setup.dart';
import '../components/calculation_result_dialog.dart';
import 'dough_action.dart';
import 'dough_screen.dart';
import 'dough_view_model.dart';

class DoughRoot extends StatefulWidget {
  const DoughRoot({super.key});

  @override
  State<DoughRoot> createState() => _DoughRootState();
}

class _DoughRootState extends State<DoughRoot> {
  late final DoughViewModel _viewModel = getIt<DoughViewModel>();

  @override
  void initState() {
    super.initState();
    _viewModel.addListener(_onStateChanged);
  }

  void _onStateChanged() {
    final result = _viewModel.state.calculationResult;
    if (result != null) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => CalculationResultDialog(result: result),
      ).then((_) {
        _viewModel.onAction(const DoughAction.clearResult());
      });
    }
  }

  @override
  void dispose() {
    _viewModel.removeListener(_onStateChanged);
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, child) {
        final state = _viewModel.state;
        
        return DoughScreen(
          state: state,
          onAction: (action) {
            // 이 곳에서 UI 단독 처리 로직(예: 단순 화면 이동 등)을 가로챌 수 있습니다.

            _viewModel.onAction(action);
          },
        );
      },
    );
  }
}
