import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants.dart';

class GlobalTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Color? cursorColor;
  final double? cursorHeight;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final double? prefixIconSize;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final double? suffixIconSize;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? floatingLabelStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final int? maxLine;
  final int? maxLength;
  final BorderRadius? borderRadius;
  final double? horizontalPadding;
  final String? validateMessage;
  final bool? obscureText;
  final bool? isPassword;
  final FocusNode? focusNode;
  final Function? onCompletel;
  final Function? onChanged;
  final Function()? onTab;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;

  const GlobalTextField({
    super.key,
    this.onFieldSubmitted,
    this.isPassword,
    required this.controller,
    required this.keyboardType,
    this.cursorColor,
    this.cursorHeight,
    this.prefixIcon,
    this.prefixIconColor,
    this.prefixIconSize,
    this.suffixIcon,
    this.suffixIconColor,
    this.suffixIconSize,
    this.labelText,
    this.labelStyle,
    this.hintText,
    this.hintStyle,
    this.border,
    this.focusedBorder,
    this.maxLine,
    this.borderRadius,
    this.maxLength,
    this.floatingLabelStyle,
    this.horizontalPadding,
    this.validateMessage,
    this.obscureText,
    this.focusNode,
    this.onCompletel,
    this.onChanged,
    this.onTab,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        onTap: onTab,
        controller: controller,
        onChanged: (value) {
          onChanged;
        },

        keyboardType: keyboardType,
        cursorColor: cursorColor ?? kPrimaryColor,
        cursorHeight: cursorHeight ?? 10.h,
        maxLines: maxLine ?? 1,
        obscureText: obscureText ?? false,
        focusNode: focusNode,

        textInputAction: textInputAction ?? TextInputAction.done,
        onFieldSubmitted: onFieldSubmitted,
        //maxLength: maxLength ?? 1000,
        validator: (String? value) {
          if (value!.isEmpty) {
            return validateMessage ?? 'Fill this field';
          }
          return null;
        },
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              prefixIcon,
              size: prefixIconSize ?? 28,
              color: prefixIconColor ?? kPrimaryColor,
            ),
          ),
          prefixIconColor: prefixIconColor,
          floatingLabelStyle: floatingLabelStyle ??
              const TextStyle(
                color: kPrimaryColor,
              ),
          labelText: labelText,
          labelStyle: labelStyle,
          hintText: hintText,
          hintStyle: hintStyle,
          suffixIcon: suffixIcon,
          border: border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  color: kPrimaryColor,
                ),
              ),
        ),
      ),
    );
  }
}
