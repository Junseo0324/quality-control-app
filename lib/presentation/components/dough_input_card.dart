import 'package:flutter/material.dart';
import '../../core/ui/app_colors.dart';
import '../../core/ui/app_text_styles.dart';



/// 디자인 시안의 "어제 도우 (1번 배치)" 등을 구성하는 카드 컴포넌트
class DoughInputCard extends StatelessWidget {
  final int batchNumber;
  final String title;
  final Color badgeColor;
  final List<Widget> children;

  const DoughInputCard({
    super.key,
    required this.batchNumber,
    required this.title,
    this.badgeColor = AppColors.charcoal,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.charcoal.withOpacity(0.07),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: badgeColor,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  batchNumber.toString(),
                  style: AppTextStyles.labelXs.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: AppTextStyles.headingSm.copyWith(
                  color: AppColors.charcoal,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children.asMap().entries.map((entry) {
              final isLast = entry.key == children.length - 1;
              return Padding(
                padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
                child: entry.value,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
