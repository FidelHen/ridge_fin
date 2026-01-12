import 'package:flutter/material.dart';
import 'package:ridge_fin/core/utils/app_colors.dart';

class RidgeButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDestructive;

  const RidgeButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isDestructive = false,
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
        style: widget.isDestructive
            ? ElevatedButton.styleFrom(
                backgroundColor: AppColors.negative,
                foregroundColor: Colors.white,
              )
            : null,
        child: widget.isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: widget.isDestructive ? Colors.white : AppColors.primaryTextColor,
                  strokeWidth: 3,
                ),
              )
            : Text(widget.label),
      ),
    );
  }
}
