import 'package:chorakae_project/core/base/blocs/local/app_localization.dart';
import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isdark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.all(context.setMinSize(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: context.setMinSize(15),
              top: context.setMinSize(15),
            ),
            child: Text(
              "main_view.Notifications".tr(context),
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: blueColor),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
                top: context.setMinSize(15), bottom: context.setMinSize(15)),
            child: Container(
              width: context.screenWidth,
              decoration: BoxDecoration(
                border: Border.all(color: isdark ? whileColor60 : whileColor80),
                borderRadius: BorderRadius.circular(
                  context.setMinSize(10),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(context.setMinSize(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(
                        context.setMinSize(5),
                      ),
                      child: Text(
                        "New",
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: isdark ? whileColor80 : darkGreyColor,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                    _notificationWidget(context, isdark),
                    _notificationWidget(context, isdark),
                    _notificationWidget(context, isdark),
                  ],
                ),
              ),
            ),
          ),
          // Icon(
          //   CupertinoIcons.news,
          //   color: Colors.grey.shade600,
          //   size: 100,
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          // Text(
          //   "Explore latest News!",
          //   style: GoogleFonts.poppins(
          //       color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          // ),
          // const SizedBox(
          //   height: 5,
          // ),
          // Text(
          //   "You will be notified whenever any \nfavorite new has released",
          //   textAlign: TextAlign.center,
          //   style: GoogleFonts.poppins(
          //     color: Colors.grey.shade600,
          //     fontSize: 18,
          //     fontWeight: FontWeight.w500,
          //   ),
          // ),
        ],
      ),
    );
  }

  Padding _notificationWidget(BuildContext context, bool isdark) {
    return Padding(
      padding: EdgeInsets.only(
          top: context.setMinSize(8), bottom: context.setMinSize(8)),
      child: Row(
        children: [
          _iconContainer(context, isdark),
          SizedBox(
            width: context.setMinSize(8),
          ),
          Expanded(
            child: Text(
              "Nouveaux Services notifications!  ",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: isdark ? whileColor80 : darkGreyColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconContainer(BuildContext context, bool isdark) {
    return Container(
      padding: EdgeInsets.all(
        context.setMinSize(10),
      ),
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: isdark ? whileColor80 : blueColor),
      child: Icon(
        IconlyBold.notification,
        color: isdark ? whileColor5 : lightGreyColor,
      ),
    );
  }
}
