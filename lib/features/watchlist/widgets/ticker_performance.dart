import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ridge_fin/core/utils/app_colors.dart';

class WatchlistTickerPerformance extends StatelessWidget {
  final double arrowSize;
  final double fontSize;

  const WatchlistTickerPerformance({super.key, this.arrowSize = 14, this.fontSize = 14});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.arrow_upward, size: arrowSize, fontWeight: FontWeight.w600, color: AppColors.positive),
        SizedBox(width: 2),
        Text(
          '1.23 (0.27%)',
          style: GoogleFonts.inter(fontSize: fontSize, fontWeight: FontWeight.w600, color: AppColors.positive),
        ),
      ],
    );
  }
}
