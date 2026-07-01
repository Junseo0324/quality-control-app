import 'dart:async';
import 'package:flutter/foundation.dart';
import '../../domain/models/calculation_result.dart';
import '../../domain/services/dough_calculator_service.dart';
import 'dough_action.dart';
import 'dough_state.dart';

/// 비즈니스 로직과 화면의 상태를 관리하는 ViewModel
class DoughViewModel with ChangeNotifier {
  final DoughCalculatorService _calculatorService;

  DoughState _state = const DoughState();
  DoughState get state => _state;

  final _actionController = StreamController<DoughAction>();
  StreamSubscription? _streamSubscription;

  DoughViewModel({
    required DoughCalculatorService calculatorService,
  }) : _calculatorService = calculatorService {
    _streamSubscription = _actionController.stream.listen(_handleAction);
  }

  void onAction(DoughAction action) {
    _actionController.add(action);
  }

  void _handleAction(DoughAction action) {
    switch (action) {
      case YesterdayDefrostChanged():
        _state = _state.copyWith(yesterdayDefrostAmount: action.amount);
      case LeftoverCarryOverChanged():
        _state = _state.copyWith(leftoverCarryOverAmount: action.amount);
      case TodayNewChanged():
        _state = _state.copyWith(todayNewAmount: action.amount);
      case Calculate():
        _calculate();
      case ClearResult():
        _state = _state.copyWith(calculationResult: null);
    }
    notifyListeners();
  }

  void _calculate() {
    // 1. 입력된 값 파싱
    final yesterdayDefrost = int.tryParse(_state.yesterdayDefrostAmount) ?? 0;
    final leftover = int.tryParse(_state.leftoverCarryOverAmount) ?? 0;

    // 2. 로직 수행
    final calculationResult = _calculatorService.calculateCarryOver(
      yesterdayDefrost: yesterdayDefrost,
      leftoverCarryOver: leftover,
    );

    // 결과를 상태(State)에 저장
    _state = _state.copyWith(calculationResult: calculationResult);
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    _actionController.close();
    super.dispose();
  }
}
