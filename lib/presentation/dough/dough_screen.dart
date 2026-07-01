import 'package:flutter/material.dart';
import '../../core/ui/app_colors.dart';
import '../components/dough_input_card.dart';
import '../components/dough_input_field.dart';
import '../components/primary_button.dart';
import 'dough_action.dart';
import 'dough_state.dart';

class DoughScreen extends StatelessWidget {
  final DoughState state;
  final ValueChanged<DoughAction> onAction;

  const DoughScreen({
    super.key,
    required this.state,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              
              DoughInputCard(
                title: '어제 도우',
                children: [
                  DoughInputField(
                    label: '해동했던 수량',
                    hintText: '예: 24',
                    initialValue: state.yesterdayDefrostAmount,
                    onChanged: (amount) => onAction(DoughAction.yesterdayDefrostChanged(amount)),
                  ),
                  DoughInputField(
                    label: '남은 이월 수량',
                    hintText: '예: 14',
                    initialValue: state.leftoverCarryOverAmount,
                    onChanged: (amount) => onAction(DoughAction.leftoverCarryOverChanged(amount)),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              
              DoughInputCard(
                title: '오늘 도우',
                children: [
                  DoughInputField(
                    label: '오늘 새로 해동할 수량',
                    hintText: '예: 20',
                    initialValue: state.todayNewAmount,
                    onChanged: (amount) => onAction(DoughAction.todayNewChanged(amount)),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              
              PrimaryButton(
                label: '계산하기',
                onTap: () => onAction(const DoughAction.calculate()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
