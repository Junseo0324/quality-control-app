import '../models/dough_type.dart';
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
        message: '어제 해동 수량을 $recommended개로 보정해서 다시 적어주세요.',
      );
    } else {
      // 정상
      return CalculationResult(
        isFakeLogicApplied: false,
        recommendedYesterdayDefrost: yesterdayDefrost,
        message: '안 바꾸고 그대로 써도 됩니다.',
      );
    }
  }
}
