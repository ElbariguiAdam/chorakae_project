import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:flutter/material.dart';

class DividerRow extends StatelessWidget {
  final String title;
  const DividerRow({
    required this.title,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Divider(
              color: greyColor,
            )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.setMinSize(6)),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const Expanded(
          flex: 2,
          child: Divider(
            color: greyColor,
          ),
        ),
      ],
    );
  }
}
