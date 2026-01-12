import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ridge_fin/core/bloc/session_bloc.dart';
import 'package:ridge_fin/core/config/app_router.gr.dart';
import 'package:ridge_fin/core/di/injection.dart';
import 'package:ridge_fin/core/utils/app_colors.dart';
import 'package:ridge_fin/core/utils/app_dimensions.dart';
import 'package:ridge_fin/core/utils/app_field_validator.dart';
import 'package:ridge_fin/core/widgets/button/ridge_button.dart';
import 'package:ridge_fin/core/widgets/input_fields/ridge_text_field.dart';
import 'package:ridge_fin/features/auth/repositories/auth_repository.dart';
import 'package:ridge_fin/features/auth/bloc/register_bloc.dart';

@RoutePage()
class AuthRegisterPage extends StatelessWidget {
  final String email;

  const AuthRegisterPage({
    super.key,
    @PathParam('email') this.email = '',
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(getIt<AuthRepository>()),
      child: _AuthRegisterView(email: email),
    );
  }
}

class _AuthRegisterView extends StatefulWidget {
  final String email;

  const _AuthRegisterView({required this.email});

  @override
  State<_AuthRegisterView> createState() => _AuthRegisterViewState();
}

class _AuthRegisterViewState extends State<_AuthRegisterView> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    if (widget.email.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _formKey.currentState?.fields['email']?.didChange(widget.email);
      });
    }
  }

  void _handleRegister() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final values = _formKey.currentState!.value;
      final firstName = values['name'] as String;
      final lastName = values['last_name'] as String;

      context.read<RegisterBloc>().add(
        RegisterSubmitted(
          email: values['email'] as String,
          password: values['password'] as String,
          firstName: firstName,
          lastName: lastName,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          state.mapOrNull(
            success: (state) {
              getIt<SessionBloc>().add(UserLoggedIn(state.user));

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Account created successfully!')),
              );

              context.router.replace(const WatchlistRoute());
            },
            error: (state) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            },
          );
        },
        child: SafeArea(
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
                          style: GoogleFonts.inter(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: AppDimensions.spacing4),
                        Text(
                          "Track your favorite stocks and check today's performance.",
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: AppColors.secondary,
                          ),
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
                              ),
                              RidgeTextField(
                                name: 'last_name',
                                hint: 'Last name',
                                validators: [NameValidator()],
                                keyboardType: TextInputType.name,
                              ),
                              RidgeTextField(
                                name: 'email',
                                hint: 'Email',
                                validators: [EmailValidator()],
                                keyboardType: TextInputType.emailAddress,
                              ),
                              RidgeTextField(
                                name: 'password',
                                hint: 'Password',
                                validators: [PasswordValidator()],
                                keyboardType: TextInputType.visiblePassword,
                                isPassword: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: AppDimensions.spacing16),
                BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    final isLoading = state.mapOrNull(loading: (_) => true) ?? false;
                    return RidgeButton(
                      label: 'Create account',
                      onPressed: isLoading ? null : _handleRegister,
                      isLoading: isLoading,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
