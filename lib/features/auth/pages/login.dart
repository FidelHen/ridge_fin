import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ridge_fin/core/bloc/session_bloc.dart';
import 'package:ridge_fin/core/di/injection.dart';
import 'package:ridge_fin/core/utils/app_colors.dart';
import 'package:ridge_fin/core/utils/app_dimensions.dart';
import 'package:ridge_fin/core/utils/app_field_validator.dart';
import 'package:ridge_fin/core/widgets/button/ridge_button.dart';
import 'package:ridge_fin/core/widgets/input_fields/ridge_text_field.dart';
import 'package:ridge_fin/features/auth/repositories/auth_repository.dart';
import 'package:ridge_fin/features/auth/bloc/login_bloc.dart';

@RoutePage()
class AuthLoginPage extends StatelessWidget {
  final String email;

  const AuthLoginPage({
    super.key,
    @PathParam('email') this.email = '',
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(getIt<AuthRepository>()),
      child: _AuthLoginView(email: email),
    );
  }
}

class _AuthLoginView extends StatefulWidget {
  final String email;

  const _AuthLoginView({required this.email});

  @override
  State<_AuthLoginView> createState() => _AuthLoginViewState();
}

class _AuthLoginViewState extends State<_AuthLoginView> {
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

  void _handleLogin() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final values = _formKey.currentState!.value;
      context.read<LoginBloc>().add(
        LoginSubmitted(
          email: values['email'] as String,
          password: values['password'] as String,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          state.mapOrNull(
            success: (state) {
              getIt<SessionBloc>().add(UserLoggedIn(state.user));

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Login successful!')),
              );

              // TODO: Navigate to home/watchlist
              // context.router.replace(const WatchlistRoute());
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
                          'Welcome back',
                          style: GoogleFonts.inter(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: AppDimensions.spacing4),
                        Text(
                          'Log in to see your watchlist and market updates.',
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
                                name: 'email',
                                hint: 'Enter your email',
                                validators: [EmailValidator()],
                                keyboardType: TextInputType.emailAddress,
                                autoFocus: widget.email.isEmpty,
                              ),
                              RidgeTextField(
                                name: 'password',
                                hint: 'Enter your password',
                                validators: [PasswordValidator()],
                                keyboardType: TextInputType.visiblePassword,
                                autoFocus: widget.email.isNotEmpty,
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
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    final isLoading = state.mapOrNull(loading: (_) => true) ?? false;
                    return RidgeButton(
                      label: 'Log in',
                      onPressed: isLoading ? null : _handleLogin,
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
