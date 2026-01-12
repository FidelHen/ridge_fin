import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ridge_fin/core/config/app_router.gr.dart';
import 'package:ridge_fin/core/di/injection.dart';
import 'package:ridge_fin/core/utils/app_dimensions.dart';
import 'package:ridge_fin/core/utils/app_field_validator.dart';
import 'package:ridge_fin/core/widgets/button/ridge_button.dart';
import 'package:ridge_fin/core/widgets/input_fields/ridge_text_field.dart';
import 'package:ridge_fin/features/auth/repositories/auth_repository.dart';
import 'package:ridge_fin/features/auth/bloc/enter_email_bloc.dart';

@RoutePage()
class AuthEnterEmailPage extends StatelessWidget {
  const AuthEnterEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EnterEmailBloc(getIt<AuthRepository>()),
      child: const _AuthEnterEmailView(),
    );
  }
}

class _AuthEnterEmailView extends StatefulWidget {
  const _AuthEnterEmailView();

  @override
  State<_AuthEnterEmailView> createState() => _AuthEnterEmailViewState();
}

class _AuthEnterEmailViewState extends State<_AuthEnterEmailView> {
  final _formKey = GlobalKey<FormBuilderState>();

  void _handleContinue() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final email = _formKey.currentState!.value['email'] as String;
      context.read<EnterEmailBloc>().add(CheckEmailExists(email));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<EnterEmailBloc, EnterEmailState>(
        listener: (context, state) {
          state.mapOrNull(
            userExists: (state) {
              context.router.push(AuthLoginRoute(email: state.email));
            },
            userNotFound: (state) {
              context.router.push(AuthRegisterRoute(email: state.email));
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
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                BlocBuilder<EnterEmailBloc, EnterEmailState>(
                  builder: (context, state) {
                    final isLoading = state.mapOrNull(loading: (_) => true) ?? false;
                    return RidgeButton(
                      label: 'Continue',
                      onPressed: isLoading ? null : _handleContinue,
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
