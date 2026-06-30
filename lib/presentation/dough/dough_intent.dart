import 'package:freezed_annotation/freezed_annotation.dart';

part 'dough_intent.freezed.dart';

@freezed
sealed class DoughIntent with _$DoughIntent {
  const factory DoughIntent.tabChanged(int index) = _TabChanged;
  const factory DoughIntent.yesterdayDefrostChanged(String amount) = _YesterdayDefrostChanged;
  const factory DoughIntent.leftoverCarryOverChanged(String amount) = _LeftoverCarryOverChanged;
  const factory DoughIntent.todayNewChanged(String amount) = _TodayNewChanged;
  const factory DoughIntent.calculate() = _Calculate;
}
