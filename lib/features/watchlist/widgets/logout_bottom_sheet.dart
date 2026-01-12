import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ridge_fin/core/bloc/session_bloc.dart';
import 'package:ridge_fin/core/config/app_router.gr.dart';
import 'package:ridge_fin/core/utils/app_dimensions.dart';
import 'package:ridge_fin/core/utils/app_images.dart';
import 'package:ridge_fin/core/widgets/button/ridge_button.dart';
import 'package:ridge_fin/core/widgets/status_image/status_image.dart';

class WatchlistLogoutBottomSheet extends StatefulWidget {
  const WatchlistLogoutBottomSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => const WatchlistLogoutBottomSheet(),
      shape: RoundedRectangleBorder(),
      isScrollControlled: true,
    );
  }

  @override
  State<WatchlistLogoutBottomSheet> createState() => _WatchlistLogoutBottomSheetState();
}

class _WatchlistLogoutBottomSheetState extends State<WatchlistLogoutBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: AppDimensions.getContentPadding(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            StatusImage(imagePath: AppImages.logout, title: 'Leaving us so soon?', description: "We'll be right here when you come back."),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            RidgeButton(
              label: 'Logout',
              isDestructive: true,
              onPressed: () {
                context.read<SessionBloc>().add(const UserLoggedOut());
                Navigator.pop(context);
                context.router.replaceAll([const AuthLandingRoute()]);
              },
            ),
            SizedBox(height: AppDimensions.spacing14),
            RidgeButton(
              label: 'Just kidding!',
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
