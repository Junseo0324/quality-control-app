import 'package:flutter/material.dart';
import '../../core/ui/app_colors.dart';
import '../components/header_tab.dart';
import '../components/dough_input_card.dart';
import '../components/dough_input_field.dart';
import '../components/primary_button.dart';
import 'dough_intent.dart';
import 'dough_state.dart';

class DoughScreen extends StatelessWidget {
  final DoughState state;
  final ValueChanged<DoughIntent> onIntent;

  const DoughScreen({
    super.key,
    required this.state,
    required this.onIntent,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 50),
              HeaderTab(
                selectedIndex: state.selectedTabIndex,
                onChanged: (index) => onIntent(DoughIntent.tabChanged(index)),
              ),
              const SizedBox(height: 24),
              
              DoughInputCard(
                title: '어제 도우',
                badgeColor: AppColors.charcoal,
                children: [
                  DoughInputField(
                    label: '해동했던 수량',
                    hintText: '예: 24',
                    initialValue: state.yesterdayDefrostAmount,
                    onChanged: (amount) => onIntent(DoughIntent.yesterdayDefrostChanged(amount)),
                  ),
                  DoughInputField(
                    label: '남은 이월 수량',
                    hintText: '예: 14',
                    initialValue: state.leftoverCarryOverAmount,
                    onChanged: (amount) => onIntent(DoughIntent.leftoverCarryOverChanged(amount)),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              
              DoughInputCard(
                title: '오늘 도우',
                badgeColor: AppColors.doughSfo,
                children: [
                  DoughInputField(
                    label: '오늘 새로 해동할 수량',
                    hintText: '예: 20',
                    initialValue: state.todayNewAmount,
                    onChanged: (amount) => onIntent(DoughIntent.todayNewChanged(amount)),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              
              PrimaryButton(
                label: '계산하기',
                onTap: () => onIntent(const DoughIntent.calculate()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
