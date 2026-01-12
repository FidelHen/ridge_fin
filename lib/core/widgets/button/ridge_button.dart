import 'package:flutter/material.dart';
import 'package:ridge_fin/core/utils/app_colors.dart';

class RidgeButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;

  const RidgeButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  State<RidgeButton> createState() => _RidgeButtonState();
}

class _RidgeButtonState extends State<RidgeButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        child: widget.isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: AppColors.primaryTextColor,
                  strokeWidth: 3,
                ),
              )
            : Text(widget.label),
      ),
    );
  }
}
