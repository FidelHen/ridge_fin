import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ridge_fin/core/utils/app_colors.dart';
import 'package:ridge_fin/core/utils/app_dimensions.dart';

class WatchlistTickerTile extends StatelessWidget {
  final String title;
  final String description;
  final Widget? trailing;
  final VoidCallback? onTap;

  const WatchlistTickerTile({
    super.key,
    required this.title,
    required this.description,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        height: 70,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(title, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600)),
                        SizedBox(height: AppDimensions.spacing4),
                        Text(
                          description,
                          style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.secondary),
                        ),
                      ],
                    ),
                  ),
                  trailing ?? const SizedBox.shrink(),
                ],
              ),
            ),
            Divider(color: AppColors.dividerColor, thickness: 1),
          ],
        ),
      ),
    );
  }
}
