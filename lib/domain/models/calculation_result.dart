class CarryOverResult {
  final bool isFakeLogicApplied;
  final int recommendedYesterdayDefrost;
  final String message;

  CarryOverResult({
    required this.isFakeLogicApplied,
    required this.recommendedYesterdayDefrost,
    required this.message,
  });
}

class CalculationResult {
  final String defrostTime;
  final String disposalTime;
  final CarryOverResult carryOverResult;

  CalculationResult({
    required this.defrostTime,
    required this.disposalTime,
    required this.carryOverResult,
  });
}
