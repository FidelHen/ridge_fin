import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ridge_fin/core/config/app_router.gr.dart';
import 'package:ridge_fin/core/utils/app_colors.dart';
import 'package:ridge_fin/core/utils/app_dimensions.dart';
import 'package:ridge_fin/core/utils/app_images.dart';
import 'package:ridge_fin/core/widgets/button/ridge_button.dart';

@RoutePage()
class AuthLandingPage extends StatelessWidget {
  const AuthLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppDimensions.getContentPadding(),
          child: Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment(0, -0.5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome to',
                            style: GoogleFonts.inter(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: AppDimensions.spacing6),
                          Image.asset(AppImages.logo, height: 24),
                        ],
                      ),
                      SizedBox(height: AppDimensions.spacing4),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppDimensions.spacing16),
                        child: Text(
                          "Follow your picks. Check today's performance.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: AppColors.secondary,
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                      Image.asset(AppImages.landing),
                    ],
                  ),
                ),
              ),
              RidgeButton(
                label: 'Continue with Email',
                onPressed: () {
                  context.router.push(const AuthEnterEmailRoute());
                },
              ),
              SizedBox(height: AppDimensions.spacing16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppDimensions.spacing16),
                child: SizedBox(
                  child: Text(
                    'By continuing you agree to terms and conditions',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
