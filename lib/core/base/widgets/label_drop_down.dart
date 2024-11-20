import 'package:chorakae_project/core/base/blocs/local/app_localization.dart';
import 'package:chorakae_project/core/base/widgets/costum_drop_down_field.dart';
import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:flutter/material.dart';

class LabelDropDown extends StatelessWidget {
  final String labelKey;
  final List<String> items;
  final String hintText;
  final ValueChanged<String?> onChanged;
  final String? selectedItem;
  final IconData icon;

  const LabelDropDown({
    super.key,
    required this.labelKey,
    required this.items,
    required this.hintText,
    required this.onChanged,
    this.selectedItem,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelKey.tr(context),
          maxLines: 1,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: isDark ? greyColor : whileColor40,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              overflow: TextOverflow.ellipsis),
        ),
        SizedBox(height: context.setHeight(8)),
        CustomDropdownField(
          iconData: icon,
          hintText: hintText,
          items: items,
          onChanged: onChanged,
          selectedItem: selectedItem,
        ),
      ],
    );
  }
}
