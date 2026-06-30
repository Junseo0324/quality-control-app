import 'package:flutter/foundation.dart';
import '../../domain/services/dough_calculator_service.dart';
import '../../domain/models/dough_type.dart';
import 'dough_intent.dart';
import 'dough_state.dart';

/// 비즈니스 로직과 화면의 상태를 관리하는 ViewModel
/// MVI (Model-View-Intent) 패턴을 적용하여 단일 진입점(onIntent)으로 이벤트를 처리합니다.
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
    );
  }

  void _calculate() {
    // 1. 입력된 값 파싱
    final yesterdayDefrost = int.tryParse(value.yesterdayDefrostAmount) ?? 0;
    final leftover = int.tryParse(value.leftoverCarryOverAmount) ?? 0;

    final doughType = DoughType.values[value.selectedTabIndex];

    // 3. 로직 수행
    final defrostTime = _calculatorService.getDefrostTime(doughType);
    final disposalTime = '다음날 마감 시 폐기';
    final carryOverResult = _calculatorService.calculateCarryOver(
      yesterdayDefrost: yesterdayDefrost,
      leftoverCarryOver: leftover,
    );

    // TODO: 계산 결과를 상태에 저장하거나 이벤트를 발생시켜 UI에서 다이얼로그를 띄우도록 처리
    print('ViewModel 계산 결과 - 야매로직 발동: ${carryOverResult.isFakeLogicApplied}, 메시지: ${carryOverResult.message}');
  }
}
