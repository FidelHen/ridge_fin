import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ridge_fin/core/config/app_router.gr.dart';
import 'package:ridge_fin/core/utils/app_colors.dart';
import 'package:ridge_fin/core/utils/app_dimensions.dart';
import 'package:ridge_fin/core/utils/app_images.dart';
import 'package:ridge_fin/core/widgets/button/ridge_button.dart';
import 'package:ridge_fin/core/widgets/status_image/status_image.dart';

@RoutePage()
class WatchlistPage extends StatefulWidget {
  const WatchlistPage({super.key});

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: Padding(
          padding: EdgeInsets.only(left: AppDimensions.spacing24),
          child: Image.asset(
            AppImages.logo,
          ),
        ),
        actionsPadding: EdgeInsets.only(right: AppDimensions.spacing16),
        actions: [
          IconButton.filled(
            onPressed: () {},
            style: IconButton.styleFrom(
              foregroundColor: AppColors.iconColor,
              backgroundColor: AppColors.iconButtonBackgroundColor,
            ),
            icon: const Icon(Icons.logout, size: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: AppDimensions.getContentPadding(),
          child: Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment(0, -0.6),
                  child: StatusImage(
                    imagePath: AppImages.emptyState,
                    title: 'Nothing under your watch!',
                    description: "Track stocks you're interested in will show up here.",
                  ),
                ),
              ),
              SizedBox(height: AppDimensions.spacing16),
              RidgeButton(
                label: 'Add Stock',
                onPressed: () {
                  context.router.push(const WatchlistSearchStockRoute());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
