import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:flutter/material.dart';

Future<String?> showLanguageChoiceDialog(BuildContext context) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
      Color buttonColor = isDarkMode ? whiteColor : darkGreyColor;
      Color dialogColor = isDarkMode ? darkGreyColor : whiteColor;

      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.setMinSize(15)),
        ),
        backgroundColor: dialogColor,
        child: Padding(
          padding: EdgeInsets.all(context.setMinSize(20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Choose Language",
                style: TextStyle(
                  fontSize: context.setMinSize(18),
                  fontWeight: FontWeight.bold,
                  color: buttonColor,
                ),
              ),
              SizedBox(height: context.setMinSize(20)),
              _buildLanguageButton(context, "Français", "fr", buttonColor),
              _buildLanguageButton(context, "English", "en", buttonColor),
              _buildLanguageButton(context, "عربي", "ar", buttonColor),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildLanguageButton(
    BuildContext context, String label, String code, Color color) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: context.setMinSize(8)),
    child: ElevatedButton(
      onPressed: () => Navigator.of(context).pop(code),
      style: ElevatedButton.styleFrom(
        foregroundColor: whiteColor,
        backgroundColor: blueColor,
        padding: EdgeInsets.symmetric(
          vertical: context.setMinSize(12),
          horizontal: context.setMinSize(20),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.setMinSize(10)),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: context.setMinSize(16)),
      ),
    ),
  );
}
