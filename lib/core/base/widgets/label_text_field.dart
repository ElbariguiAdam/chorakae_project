import 'package:chorakae_project/core/base/blocs/local/app_localization.dart';
import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:chorakae_project/core/base/widgets/costum_text_field.dart';
import 'package:flutter/material.dart';

class LabeledTextField extends StatelessWidget {
  final String labelKey;
  final TextEditingController controller;
  final IconData icon;
  final bool isPassword;

  const LabeledTextField({
    required this.labelKey,
    required this.controller,
    required this.icon,
    super.key,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelKey.tr(context),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: isDark ? greyColor : whileColor40,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
        ),
        SizedBox(height: context.setHeight(8)),
        CustomTextField(
          controller: controller,
          hintText: labelKey.tr(context),
          icon: icon,
          isPassword: isPassword,
        ),
      ],
    );
  }
}
