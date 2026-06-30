import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/models/calculation_result.dart';

part 'dough_state.freezed.dart';

@freezed
abstract class DoughState with _$DoughState {
  const factory DoughState({
    @Default(0) int selectedTabIndex,
    @Default('') String yesterdayDefrostAmount,
    @Default('') String leftoverCarryOverAmount,
    @Default('') String todayNewAmount,
    CalculationResult? calculationResult,
  }) = _DoughState;
}
