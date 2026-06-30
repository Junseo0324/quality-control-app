import 'package:flutter/material.dart';
import '../../core/ui/app_colors.dart';
import '../../core/ui/app_text_styles.dart';
import '../../domain/models/calculation_result.dart';
import 'primary_button.dart';

class CalculationResultDialog extends StatelessWidget {
  final CalculationResult result;

  const CalculationResultDialog({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      backgroundColor: AppColors.white,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 다이얼로그 헤더
            Row(
              children: [
                const Icon(Icons.check_circle_rounded, color: AppColors.doughSfo, size: 28),
                const SizedBox(width: 8),
                Text(
                  '계산 완료',
                  style: AppTextStyles.headingMd.copyWith(color: AppColors.charcoal),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // 야매 로직 (수량 보정) 혹은 정상 상태 뷰
            if (result.isFakeLogicApplied) ...[
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3E0), // 부드러운 오렌지 배경
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFFFB74D), width: 1.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.warning_rounded, color: Color(0xFFF57C00), size: 24),
                        const SizedBox(width: 8),
                        Text(
                          '수량 보정 필요',
                          style: AppTextStyles.labelMd.copyWith(
                            color: const Color(0xFFF57C00),
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '이월 수량이 해동 수량보다 많습니다.\n차트에 아래 수량으로 수정해서 적어주세요.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodySm.copyWith(
                        color: const Color(0xFFE65100).withOpacity(0.8),
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFF57C00).withOpacity(0.15),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            '어제 해동 수량',
                            style: AppTextStyles.labelMd.copyWith(
                              color: AppColors.warmGray,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '${result.recommendedYesterdayDefrost}',
                                style: const TextStyle(
                                  fontSize: 64,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFFE65100),
                                  height: 1.1,
                                  letterSpacing: -2,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '개',
                                style: AppTextStyles.headingMd.copyWith(
                                  color: const Color(0xFFE65100),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ] else ...[
              // 정상인 경우 (수정 불필요)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  children: [
                    const Icon(Icons.check_circle_outline, color: AppColors.doughSfo, size: 64),
                    const SizedBox(height: 16),
                    Text(
                      '수정할 내용이 없습니다',
                      style: AppTextStyles.headingSm.copyWith(color: AppColors.charcoal),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '기존 차트 내용을 그대로 사용하세요.',
                      style: AppTextStyles.bodySm.copyWith(color: AppColors.warmGray),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 32),

            // 확인 버튼
            PrimaryButton(
              label: '확인',
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
