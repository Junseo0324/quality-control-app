import 'package:freezed_annotation/freezed_annotation.dart';

part 'dough_state.freezed.dart';

@freezed
abstract class DoughState with _$DoughState {
  const factory DoughState({
    @Default(0) int selectedTabIndex,
    @Default('') String yesterdayDefrostAmount,
    @Default('') String leftoverCarryOverAmount,
    @Default('') String todayNewAmount,
  }) = _DoughState;
}
