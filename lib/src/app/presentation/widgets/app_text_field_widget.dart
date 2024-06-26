import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_streamline/src/core/extentions.dart';
import 'package:new_streamline/src/core/styles/colors_constant.dart';
import 'package:new_streamline/src/core/styles/text_styles_constants.dart';

class AppTextFieldWidget extends StatefulWidget {
  final String hintText;
  final Color? fillColor;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? maxLength;
  final bool isPassword;
  final bool isCapitalized;
  final void Function(String? value)? onSaved;
  final void Function(String? value)? onChanged;
  final void Function(String? value)? onFieldSubmitted;
  final String? Function(String? value)? validator;
  final FocusNode? focusNode;
  final String? initialValue;
  final Widget? suffix;
  final Widget? prefix;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextFieldWidget({
    Key? key,
    required this.hintText,
    this.fillColor,
    this.maxLines,
    this.maxLength,
    this.keyboardType,
    this.isPassword = false,
    this.isCapitalized = false,
    this.onSaved,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.focusNode,
    this.initialValue,
    this.suffix,
    this.prefix,
    this.onTap,
    this.controller,
    this.inputFormatters,
  }) : super(key: key);

  @override
  State<AppTextFieldWidget> createState() => _AppTextFieldWidgetState();
}

class _AppTextFieldWidgetState extends State<AppTextFieldWidget> {
  // for password hiding.
  late bool _isPasswordHidden = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.onTap != null,
      onTap: widget.onTap,
      initialValue: widget.initialValue,
      controller: widget.controller,
      maxLines: widget.maxLines ?? 1,
      obscureText: _isPasswordHidden,
      style:
          TextStylesConstants.font16Medium.copyWith(color: 'darkGrey_white'.th),
      decoration: InputDecoration(
        isDense: true,
        fillColor: widget.fillColor ?? 'lighterGrey_lighterBlack'.th,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            color: 'lightGrey_white'.th,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            color: 'lightGrey_white'.th,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: const BorderSide(
            color: ColorsConstants.red,
            width: 1,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            color: 'lightGrey_white'.th,
            width: 1,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        hintText: widget.hintText,
        hintStyle: TextStylesConstants.font16Medium
            .copyWith(color: 'darkGrey_white'.th),
        prefixIcon: widget.prefix,
        suffixIcon: () {
          if (widget.isPassword) {
            return InkWell(
              borderRadius: BorderRadius.circular(16.r),
              onTap: () {
                setState(() {
                  _isPasswordHidden = !_isPasswordHidden;
                });
              },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Icon(
                  key: UniqueKey(),
                  _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                  color: ColorsConstants.mainGrey,
                  size: 20.h,
                ),
              ),
            );
          } else {
            return widget.suffix;
          }
        }(),
      ),
      textCapitalization: widget.isCapitalized
          ? TextCapitalization.characters
          : TextCapitalization.none,
      inputFormatters: widget.inputFormatters,
      maxLength: widget.maxLength,
      keyboardType: widget.keyboardType,
      focusNode: widget.focusNode,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }
}
