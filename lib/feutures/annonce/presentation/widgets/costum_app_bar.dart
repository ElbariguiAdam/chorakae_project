import 'package:chorakae_project/core/base/blocs/local/app_localization.dart';
import 'package:chorakae_project/core/constants/app_images_path/app_images_path.dart';
import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:chorakae_project/core/base/widgets/costum_text_field.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CostumAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CostumAppBar({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    bool isdark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: isdark ? trans : whiteColor,
          boxShadow: [
            BoxShadow(
              color: isdark ? trans : whileColor80,
              offset: const Offset(0, 0.2),
              blurRadius: 2,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
              icon: const Icon(
                IconlyBold.category,
                color: blueColor,
              ),
            ),
            Expanded(
              child: CustomTextField(
                controller: TextEditingController(),
                hintText: "Home_screen.search".tr(context),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(context.setMinSize(8)),
              child: Image.asset(
                AppImagesPath.kAppLogo,
                height: context.setHeight(50),
                width: context.setWidth(50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70);
}
