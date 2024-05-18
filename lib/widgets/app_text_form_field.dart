import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twenty_r/colors.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final Color? backgroundColor;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final Function(String?) validator;

  const AppTextFormField(
      {super.key,
      this.contentPadding,
      this.focusedBorder,
      this.enabledBorder,
      this.inputTextStyle,
      this.hintStyle,
      required this.hintText,
      this.isObscureText,
      this.suffixIcon,
      this.prefixIcon,
      this.backgroundColor,
      this.controller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          isDense: true,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          //on focused
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                  borderSide: BorderSide(color: brown, width: 1.3),
                  borderRadius: BorderRadius.circular(16)),
          //on enabled
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                  borderSide: BorderSide(
                    color: brownLight,
                    width: 1.3,
                  ),
                  borderRadius: BorderRadius.circular(16)),
          //errorBorder
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16)),
          //focusedErrorBorder
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16)),
          hintStyle: hintStyle ?? TextStyle(fontSize: 16, color: brown),
          labelStyle: hintStyle ?? TextStyle(fontSize: 16, color: brown),
          hintText: hintText,
          labelText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          fillColor: backgroundColor ?? moreLighter,
          filled: true),
      obscureText: isObscureText ?? false,
      style: TextStyle(fontSize: 16, color: brown),
      validator: (value) {
        return validator(value);
      },
    );
  }
}
