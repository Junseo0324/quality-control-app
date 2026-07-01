import 'package:flutter/material.dart';
import '../../core/ui/app_colors.dart';
import '../../core/ui/app_text_styles.dart';

class CameraRoot extends StatelessWidget {
  const CameraRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera', style: AppTextStyles.headingSm),
        backgroundColor: AppColors.creamBg,
        elevation: 0,
      ),
      body: Center(
        child: Text(
          '카메라 기능이 들어갈 화면입니다.',
          style: AppTextStyles.bodyMd.copyWith(color: AppColors.warmGray),
        ),
      ),
    );
  }
}
