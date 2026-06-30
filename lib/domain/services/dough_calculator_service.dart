import '../models/calculation_result.dart';

class DoughCalculatorService {

  CalculationResult calculateCarryOver({
    required int yesterdayDefrost,
    required int leftoverCarryOver,
  }) {
    if (leftoverCarryOver > yesterdayDefrost) {
      final recommended = (leftoverCarryOver / 10).ceil() * 10;
      return CalculationResult(
        isFakeLogicApplied: true,
        recommendedYesterdayDefrost: recommended,
      );
    } else {
      // 정상
      return CalculationResult(
        isFakeLogicApplied: false,
        recommendedYesterdayDefrost: yesterdayDefrost,
      );
    }
  }
}
