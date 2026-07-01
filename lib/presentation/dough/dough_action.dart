import 'package:freezed_annotation/freezed_annotation.dart';

part 'dough_action.freezed.dart';

@freezed
sealed class DoughAction with _$DoughAction {
  const factory DoughAction.yesterdayDefrostChanged(String amount) = YesterdayDefrostChanged;
  const factory DoughAction.leftoverCarryOverChanged(String amount) = LeftoverCarryOverChanged;
  const factory DoughAction.todayNewChanged(String amount) = TodayNewChanged;
  const factory DoughAction.calculate() = Calculate;
  const factory DoughAction.clearResult() = ClearResult;
}
