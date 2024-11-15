import 'package:chorakae_project/core/base/blocs/local/app_localization.dart';
import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  const CardImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(context.setMinSize(10)),
      child: Stack(
        children: [
          Image.network(
            'https://assets.blog.siemens.com/uploads/2020/06/dsc-asc-53-soc-0065-virtual-layer-72dpi-rgb_original-1024x768.jpeg',
            height: context.setHeight(180),
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                alignment: Alignment.center,
                height: context.setHeight(30),
                width: context.setWidth(80),
                decoration: BoxDecoration(
                  color: successColor,
                  borderRadius: BorderRadius.circular(
                    context.setMinSize(10),
                  ),
                ),
                child: Text(
                  "status.verifier".tr(context),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: whiteColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
