import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ridge_fin/core/config/app_router.gr.dart';
import 'package:ridge_fin/core/utils/app_dimensions.dart';
import 'package:ridge_fin/core/utils/app_field_validator.dart';
import 'package:ridge_fin/core/widgets/button/ridge_button.dart';
import 'package:ridge_fin/core/widgets/input_fields/ridge_text_field.dart';

@RoutePage()
class AuthEnterEmailPage extends StatefulWidget {
  const AuthEnterEmailPage({super.key});

  @override
  State<AuthEnterEmailPage> createState() => _AuthEnterEmailPageState();
}

class _AuthEnterEmailPageState extends State<AuthEnterEmailPage> {
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
              FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    RidgeTextField(
                      name: 'email',
                      hint: 'Continue with your email',
                      validators: [EmailValidator()],
                      keyboardType: TextInputType.emailAddress,
                      autoFocus: true,
                      enabled: true,
                    ),
                  ],
                ),
              ),
              Spacer(),
              RidgeButton(
                label: 'Continue',
                onPressed: () {
                  context.router.push(const AuthRegisterRoute());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
