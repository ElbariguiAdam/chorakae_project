import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/constants/values/values.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.name,
    required this.email,
    required this.imageSrc,
    this.proLableText = "Pro",
    this.isPro = false,
    this.press,
    this.isShowHi = true,
    this.isShowArrow = true,
    this.isDrwaer = false,
    required this.isdark,
  });

  final String name, email, imageSrc;
  final String proLableText;
  final bool isPro, isShowHi, isShowArrow;
  final VoidCallback? press;
  final bool isDrwaer;
  final bool isdark;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: false,
      child: ListTile(
        onTap: press,
        leading: CircleAvatar(
          backgroundColor: whileColor80.withOpacity(0.5),
          foregroundImage: NetworkImage(imageSrc),
          radius: context.setHeight(28),
        ),
        title: Row(
          children: [
            Text(
              isShowHi ? "Hi $name" : name,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: isDrwaer
                      ? whiteColor
                      : isdark
                          ? whileColor80
                          : whileColor10),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(width: defaultPadding / 2),
            if (isPro)
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding / 2,
                    vertical: defaultPadding / 4),
                decoration: const BoxDecoration(
                  color: blueColor,
                  borderRadius:
                      BorderRadius.all(Radius.circular(defaultBorderRadious)),
                ),
                child: Text(
                  proLableText,
                  style: const TextStyle(
                    // fontFamily: grandisExtendedFont,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    letterSpacing: 0.7,
                    height: 1,
                  ),
                ),
              ),
          ],
        ),
        subtitle: Text(
          email,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: isDrwaer ? lightGreyColor : whileColor60),
        ),
        trailing: isShowArrow ? const Icon(IconlyLight.arrow_right_2) : null,
      ),
    );
  }
}
