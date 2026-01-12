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
class AuthRegisterPage extends StatefulWidget {
  const AuthRegisterPage({super.key});

  @override
  State<AuthRegisterPage> createState() => _AuthRegisterPageState();
}

class _AuthRegisterPageState extends State<AuthRegisterPage> {
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
                        'Create your Ridge account',
                        style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: AppDimensions.spacing4),
                      Text(
                        "Track your favorite stocks and check today's performance.",
                        style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.secondary),
                      ),
                      SizedBox(height: AppDimensions.spacing32),
                      FormBuilder(
                        key: _formKey,
                        child: Column(
                          spacing: AppDimensions.spacing14,
                          children: [
                            RidgeTextField(
                              name: 'name',
                              hint: 'First name',
                              validators: [NameValidator()],
                              keyboardType: TextInputType.name,
                              autoFocus: true,
                              enabled: true,
                            ),
                            RidgeTextField(
                              name: 'last_name',
                              hint: 'Last name',
                              validators: [NameValidator()],
                              keyboardType: TextInputType.name,
                              enabled: true,
                            ),
                            RidgeTextField(
                              name: 'email',
                              hint: 'Email',
                              validators: [EmailValidator()],
                              keyboardType: TextInputType.emailAddress,
                              enabled: true,
                            ),
                            RidgeTextField(
                              name: 'password',
                              hint: 'Password',
                              validators: [PasswordValidator()],
                              keyboardType: TextInputType.visiblePassword,
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
                label: 'Create account',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
