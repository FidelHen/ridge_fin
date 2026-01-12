import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ridge_fin/core/utils/app_colors.dart';
import 'package:ridge_fin/core/utils/app_field_validator.dart';

class RidgeTextField extends StatefulWidget {
  final String name;
  final String? label;
  final String? hint;
  final bool isPassword;
  final bool autoFocus;
  final bool enabled;
  final TextEditingController? controller;
  final List<TextInputFormatter> inputFormatters;
  final List<FieldValidator> validators;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final ValueChanged<String?>? onChanged;

  const RidgeTextField({
    super.key,
    required this.name,
    this.label,
    this.hint,
    this.isPassword = false,
    this.autoFocus = false,
    this.enabled = true,
    this.controller,
    this.inputFormatters = const [],
    this.validators = const [],
    this.prefix,
    this.suffix,
    this.keyboardType,
    this.onChanged,
  });

  @override
  State<RidgeTextField> createState() => _RidgeTextFieldState();
}

class _RidgeTextFieldState extends State<RidgeTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.enabled ? 1.0 : 0.5,
      child: SizedBox(
        height: 54,
        child: FormBuilderTextField(
          name: widget.name,
          controller: widget.controller,
          autofocus: widget.autoFocus,
          enabled: widget.enabled,
          obscureText: widget.isPassword && _obscureText,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
          onChanged: widget.onChanged,
          style: GoogleFonts.inter(
            color: AppColors.primaryTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          cursorColor: AppColors.primaryTextColor,
          decoration: InputDecoration(
            labelText: widget.label,
            hintText: widget.hint,
            filled: true,
            fillColor: AppColors.textFieldBackground,
            prefixIcon: widget.prefix,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.iconColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : widget.suffix,
            labelStyle: GoogleFonts.inter(
              color: AppColors.secondary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            hintStyle: GoogleFonts.inter(
              color: AppColors.secondary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: const BorderSide(
                color: AppColors.brandColor,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: const BorderSide(
                color: AppColors.negative,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: const BorderSide(
                color: AppColors.negative,
                width: 2,
              ),
            ),
            disabledBorder: InputBorder.none,
          ),
          validator: widget.validators.isEmpty
              ? null
              : (value) {
                  for (final validator in widget.validators) {
                    final error = validator.validate(value);
                    if (error != null) {
                      return error;
                    }
                  }
                  return null;
                },
        ),
      ),
    );
  }
}
