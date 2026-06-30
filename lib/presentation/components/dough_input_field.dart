import 'package:flutter/material.dart';

import '../../core/ui/app_colors.dart';
import '../../core/ui/app_text_styles.dart';

class DoughInputField extends StatefulWidget {
  final String label;
  final String hintText;
  final String initialValue;
  final ValueChanged<String>? onChanged;

  const DoughInputField({
    super.key,
    required this.label,
    required this.hintText,
    this.initialValue = '',
    this.onChanged,
  });

  @override
  State<DoughInputField> createState() => _DoughInputFieldState();
}

class _DoughInputFieldState extends State<DoughInputField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    _controller.addListener(() {
      widget.onChanged?.call(_controller.text);
    });
  }

  @override
  void didUpdateWidget(covariant DoughInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue && _controller.text != widget.initialValue) {
      _controller.text = widget.initialValue;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppTextStyles.labelSm.copyWith(
            color: AppColors.warmGray,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 54,
          decoration: BoxDecoration(
            color: AppColors.creamBg,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  style: AppTextStyles.displaySm.copyWith(
                    color: AppColors.charcoal,
                    fontWeight: FontWeight.w700,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    hintStyle: AppTextStyles.displaySm.copyWith(
                      color: AppColors.charcoal.withOpacity(0.5),
                      fontWeight: FontWeight.w700,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 16, right: 8),
                    isDense: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  '개',
                  style: AppTextStyles.bodySm.copyWith(
                    color: AppColors.warmGray,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}