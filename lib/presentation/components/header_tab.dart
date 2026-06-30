import 'package:flutter/material.dart';
import '../../core/ui/app_colors.dart';
import '../../core/ui/app_text_styles.dart';

class HeaderTab extends StatelessWidget {
  final int selectedIndex;
  final void Function(int index) onChanged;

  const HeaderTab({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  static const _tabs = [
    (label: 'SFO', activeColor: AppColors.doughSfo),
    (label: 'PAN', activeColor: AppColors.doughPan),
    (label: 'SCP', activeColor: AppColors.doughScp),
    (label: 'THIN', activeColor: AppColors.doughThin),
  ];

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
          Text(
            '도우 종류',
            style: AppTextStyles.labelMd.copyWith(color: AppColors.warmGray),
          ),
          const SizedBox(height: 12),
          Row(
            children: List.generate(_tabs.length, (index) {
              final tab = _tabs[index];
              final isSelected = index == selectedIndex;

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: index == _tabs.length - 1 ? 0 : 8,
                  ),
                  child: GestureDetector(
                    onTap: () => onChanged(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOut,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected ? tab.activeColor : AppColors.creamBg,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow:
                            isSelected
                                ? [
                                  BoxShadow(
                                    color: tab.activeColor.withOpacity(0.35),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ]
                                : [],
                      ),
                      child: Text(
                        tab.label,
                        style: AppTextStyles.bodySm.copyWith(
                          fontWeight: FontWeight.w700,
                          color:
                              isSelected ? AppColors.white : AppColors.warmGray,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
