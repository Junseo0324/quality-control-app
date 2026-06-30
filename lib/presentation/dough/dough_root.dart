import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../core/di/di_setup.dart';
import '../components/calculation_result_dialog.dart';
import 'dough_intent.dart';
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
  void initState() {
    super.initState();
    // 뷰모델 상태 변경을 구독하여 사이드 이펙트(다이얼로그 띄우기)를 처리합니다.
    _viewModel.addListener(_onStateChanged);
  }

  void _onStateChanged() {
    final result = _viewModel.value.calculationResult;
    // 계산 결과가 존재하면 다이얼로그를 띄웁니다.
    if (result != null) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => CalculationResultDialog(result: result),
      ).then((_) {
        _viewModel.onIntent(const DoughIntent.clearResult());
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
