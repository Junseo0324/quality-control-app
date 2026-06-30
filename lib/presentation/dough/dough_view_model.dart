import 'package:flutter/foundation.dart';
import '../../domain/models/calculation_result.dart';
import '../../domain/services/dough_calculator_service.dart';
import '../../domain/models/dough_type.dart';
import 'dough_intent.dart';
import 'dough_state.dart';

/// 비즈니스 로직과 화면의 상태를 관리하는 ViewModel
class DoughViewModel extends ValueNotifier<DoughState> {
  final DoughCalculatorService _calculatorService;

  DoughViewModel(this._calculatorService) : super(const DoughState());

  void onIntent(DoughIntent intent) {
    intent.when(
      tabChanged: (index) => value = value.copyWith(selectedTabIndex: index),
      yesterdayDefrostChanged: (amount) => value = value.copyWith(yesterdayDefrostAmount: amount),
      leftoverCarryOverChanged: (amount) => value = value.copyWith(leftoverCarryOverAmount: amount),
      todayNewChanged: (amount) => value = value.copyWith(todayNewAmount: amount),
      calculate: _calculate,
      clearResult: () => value = value.copyWith(calculationResult: null),
    );
  }

  void _calculate() {
    // 1. 입력된 값 파싱
    final yesterdayDefrost = int.tryParse(value.yesterdayDefrostAmount) ?? 0;
    final leftover = int.tryParse(value.leftoverCarryOverAmount) ?? 0;

    // 2. 선택된 도우 종류 판별
    final doughType = DoughType.values[value.selectedTabIndex];

    // 3. 로직 수행
    final calculationResult = _calculatorService.calculateCarryOver(
      yesterdayDefrost: yesterdayDefrost,
      leftoverCarryOver: leftover,
    );

    // 결과를 상태(State)에 저장하여 UI가 감지하도록 합니다 (단방향 데이터 플로우)
    value = value.copyWith(calculationResult: calculationResult);
  }
}
