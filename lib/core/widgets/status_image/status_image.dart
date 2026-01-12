import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ridge_fin/core/utils/app_colors.dart';
import 'package:ridge_fin/core/utils/app_dimensions.dart';
import 'package:ridge_fin/core/utils/app_images.dart';

class StatusImage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const StatusImage({super.key, required this.imagePath, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          AppImages.emptyState,
          height: 160,
        ),
        SizedBox(height: AppDimensions.spacing28),
        Text(
          title,
          style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: AppDimensions.spacing4),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.spacing24),
          child: Text(
            description,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.secondary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
