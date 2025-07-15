// lib/app/shared/widgets/custom_button.dart
import 'package:flutter/material.dart';
import 'package:baridimob_app/app/shared/constants/app_colors.dart';
import 'package:baridimob_app/app/shared/constants/app_dimens.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.primaryBlue,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.borderRadiusDefault),
        ),
      ),
      child: isLoading
          ? const CircularProgressIndicator(color: AppColors.white)
          : Text(
              text,
              style: TextStyle(color: textColor ?? AppColors.white, fontSize: 18),
            ),
    );
  }
}