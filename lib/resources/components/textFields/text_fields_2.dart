import 'package:flutter/material.dart';

import '../../colors/app_colors.dart';
import '../../colors/debug_tools.dart';
import '../../text_styles/text_styles.dart';



class TextFields2 extends StatelessWidget {
  const TextFields2(
      {super.key,
      this.controller,
      this.node,
      this.hintText,
      this.maxLines,
      this.padding,
      this.validator,
      this.readOnly});

  final TextEditingController? controller;
  final FocusNode? node;
  final String? hintText;
  final int? maxLines;
  final EdgeInsets? padding;
  final bool? readOnly;
  final Function(dynamic)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(8),
      child: TextFormField(
        readOnly: readOnly ?? false,
        controller: controller,
        focusNode: node,
        maxLines: maxLines,
        validator: (value) {
          if (validator != null) {
            return validator!(value);
          }
          return null;
        },
        style: AppTextStyle.rMedium.copyWith(
            fontSize: 14,
            color: isLightTheme(context)
                ? AppColor.blackColor
                : AppColor.whiteColor),
        decoration: InputDecoration(
          focusColor: isLightTheme(context)
              ? AppColor.buttonColorLight
              : AppColor.buttonColorDark,
          hoverColor: isLightTheme(context)
              ? AppColor.buttonColorLight
              : AppColor.buttonColorDark,
          fillColor: isLightTheme(context)
              ? AppColor.buttonColorLight
              : AppColor.buttonColorDark,
          contentPadding:
              const EdgeInsets.only(top: 6, bottom: 6, left: 10, right: 10),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: isLightTheme(context)
                      ? AppColor.darkGrey
                      : AppColor.lightWhiteColor,
                  width: 0.0),
              borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: isLightTheme(context)
                      ? AppColor.darkGrey
                      : AppColor.lightWhiteColor,
                  width: 0.0),
              borderRadius: BorderRadius.circular(12)),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: isLightTheme(context)
                      ? AppColor.darkGrey
                      : AppColor.lightWhiteColor,
                  width: 0.0),
              borderRadius: BorderRadius.circular(12)),
          hintText: hintText,
          hintStyle: AppTextStyle.rMedium.copyWith(
              fontSize: 14,
              color: isLightTheme(context)
                  ? AppColor.mediumgrey
                  : AppColor.whiteColor),
        ),
      ),
    );
  }
}
