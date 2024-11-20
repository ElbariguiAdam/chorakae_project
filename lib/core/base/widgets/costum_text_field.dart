import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;

  final FormFieldValidator<String>? validator;
  final IconData? icon;

  const CustomTextField({
    required this.controller,
    required this.hintText,
    this.validator,
    super.key,
    this.icon = IconlyLight.search,
    this.isPassword = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    bool isdark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.all(context.setMinSize(8)),
      child: TextFormField(
        cursorColor: whileColor60,
        style: Theme.of(context).textTheme.bodyMedium,
        controller: widget.controller,
        obscureText: obscureText,
        validator: widget.validator,
        onTapOutside: (event) =>
            FocusScope.of(context).requestFocus(FocusNode()),
        decoration: InputDecoration(
          prefixIcon: Icon(
            widget.icon,
            color: isdark ? whileColor80 : whileColor60,
          ),
          suffix: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Icon(
                    obscureText ? IconlyBold.show : IconlyLight.hide,
                  ),
                )
              : null,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
          hintText: widget.hintText,
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
