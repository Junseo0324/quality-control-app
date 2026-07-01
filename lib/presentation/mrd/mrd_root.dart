import 'package:flutter/material.dart';
import '../../core/ui/app_colors.dart';
import '../../core/ui/app_text_styles.dart';

class MrdRoot extends StatelessWidget {
  const MrdRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MRD', style: AppTextStyles.headingSm),
        backgroundColor: AppColors.creamBg,
        elevation: 0,
      ),
      body: Center(
        child: Text(
          'MRD 관리 기능이 들어갈 화면입니다.',
          style: AppTextStyles.bodyMd.copyWith(color: AppColors.warmGray),
        ),
      ),
    );
  }
}
