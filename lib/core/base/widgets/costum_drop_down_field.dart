import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CustomDropdownField extends StatelessWidget {
  final List<String> items;
  final String hintText;
  final ValueChanged<String?> onChanged;
  final String? selectedItem;
  final IconData iconData;

  const CustomDropdownField({
    required this.items,
    required this.hintText,
    required this.onChanged,
    this.selectedItem,
    super.key, required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    bool isdark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.all(context.setMinSize(8)),
      child: DropdownButtonFormField<String>(
        value: selectedItem,
        items: items
            .map((item) => DropdownMenuItem(value: item, child: Text(item)))
            .toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Icon(
            iconData,
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
          filled: true,
          fillColor: isdark ? whileColor10 : lightGreyColor,
        ),
        dropdownColor: isdark ? whileColor10 : lightGreyColor,
      ),
    );
  }
}
