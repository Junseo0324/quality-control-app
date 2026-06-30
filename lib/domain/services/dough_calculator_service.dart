import '../models/dough_type.dart';
import '../models/calculation_result.dart';

class DoughCalculatorService {
  String getDefrostTime(DoughType type) {
    if (type == DoughType.sfo) {
      return '10:00';
    }
    return '22:00';
  }

  String getAdjustedDisposalTime(DateTime calculatedDisposalTime) {
    if (calculatedDisposalTime.hour == 10) {
      return '(하루 전날) 23:00 마감 시 폐기';
    }
    
    final hour = calculatedDisposalTime.hour.toString().padLeft(2, '0');
    final minute = calculatedDisposalTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute 폐기'; 
  }

  CarryOverResult calculateCarryOver({
    required int yesterdayDefrost,
    required int leftoverCarryOver,
  }) {
    if (leftoverCarryOver > yesterdayDefrost) {
      final recommended = (leftoverCarryOver / 10).ceil() * 10;
      return CarryOverResult(
        isFakeLogicApplied: true,
        recommendedYesterdayDefrost: recommended,
        message: '어제 해동 수량을 $recommended개로 보정해서 다시 적어주세요.',
      );
    } else {
      // 정상
      return CarryOverResult(
        isFakeLogicApplied: false,
        recommendedYesterdayDefrost: yesterdayDefrost,
        message: '안 바꾸고 그대로 써도 됩니다.',
      );
    }
  }
}
