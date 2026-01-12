import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ridge_fin/core/utils/app_colors.dart';
import 'package:ridge_fin/core/utils/app_dimensions.dart';
import 'package:ridge_fin/features/watchlist/models/company_news_model.dart';

class WatchlistNewsTile extends StatelessWidget {
  final CompanyNewsModel article;
  final VoidCallback? onTap;

  const WatchlistNewsTile({
    super.key,
    required this.article,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final date = DateTime.fromMillisecondsSinceEpoch(article.datetime * 1000);
    final formattedDate = DateFormat('MMM dd, yyyy').format(date);

    return Padding(
      padding: EdgeInsets.only(bottom: AppDimensions.spacing12),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppColors.dividerColor),
          ),
          padding: EdgeInsets.all(AppDimensions.spacing14),
          child: Row(
            children: [
              if (article.image.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    article.image,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 60,
                        height: 60,
                        color: AppColors.textFieldBackground,
                        child: Icon(
                          Icons.article,
                          color: AppColors.iconColor,
                        ),
                      );
                    },
                  ),
                ),
              SizedBox(width: AppDimensions.spacing16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.headline,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: AppDimensions.spacing4),
                    Text(
                      '${article.source} • $formattedDate',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
