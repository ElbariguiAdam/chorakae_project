import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final IconData? icon;

  const CustomTextField({
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    super.key,
    this.icon = IconlyLight.search,
  });

  @override
  Widget build(BuildContext context) {
    bool isdark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.all(context.setMinSize(8)),
      child: TextFormField(
        cursorColor: whileColor60,
        style: Theme.of(context).textTheme.bodyMedium,
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: isdark ? whileColor80 : whileColor60,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: isdark ? whileColor80 : whileColor60,
              ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: isdark ? whileColor80 : whileColor80, width: 1),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: isdark ? whileColor80 : whileColor80, width: 0.5),
            borderRadius: BorderRadius.circular(8.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: errorColor),
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: isdark ? whileColor10 : lightGreyColor,
        ),
      ),
    );
  }
}
