import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ridge_fin/core/utils/app_colors.dart';
import 'package:ridge_fin/core/utils/app_dimensions.dart';
import 'package:ridge_fin/core/utils/app_field_validator.dart';
import 'package:ridge_fin/core/widgets/button/ridge_button.dart';
import 'package:ridge_fin/core/widgets/input_fields/ridge_text_field.dart';

@RoutePage()
class AuthLoginPage extends StatefulWidget {
  const AuthLoginPage({super.key});

  @override
  State<AuthLoginPage> createState() => _AuthLoginPageState();
}

class _AuthLoginPageState extends State<AuthLoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: AppDimensions.getContentPadding(),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back',
                        style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: AppDimensions.spacing4),
                      Text(
                        'Log in to see your watchlist and market updates.',
                        style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.secondary),
                      ),
                      SizedBox(height: AppDimensions.spacing32),
                      FormBuilder(
                        key: _formKey,
                        child: Column(
                          spacing: AppDimensions.spacing14,
                          children: [
                            RidgeTextField(
                              name: 'email',
                              hint: 'Enter your email',
                              validators: [EmailValidator()],
                              keyboardType: TextInputType.emailAddress,
                              autoFocus: true,
                              enabled: true,
                            ),
                            RidgeTextField(
                              name: 'password',
                              hint: 'Enter your password',
                              validators: [PasswordValidator()],
                              keyboardType: TextInputType.visiblePassword,
                              autoFocus: false,
                              enabled: true,
                              isPassword: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: AppDimensions.spacing24),
              RidgeButton(
                label: 'Log in',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
