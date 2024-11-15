import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class AnnoncePage extends StatelessWidget {
  const AnnoncePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isdark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                ImageSlideshow(
                  width: double.infinity,
                  height: context.setHeight(250),
                  initialPage: 0,
                  indicatorColor: blueColor,
                  indicatorBackgroundColor: whileColor60,
                  onPageChanged: (value) {
                    print('Page changed: $value');
                  },
                  autoPlayInterval: null,
                  isLoop: false,
                  children: [
                    Image.network(
                      'https://th.bing.com/th/id/OIP.WzD0UWk6lDY8YpZaCkqJ2QHaEZ?rs=1&pid=ImgDetMain',
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      'https://querysprout.com/wp-content/uploads/2022/03/Untitled-design-53-3.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      'https://th.bing.com/th/id/OIP.nAd5EeHQ6rQBNIoC1hwxtgHaE7?rs=1&pid=ImgDetMain',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(context.setMinSize(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _iconButton(
                        context,
                        IconlyLight.arrow_left,
                      ),
                      Row(
                        children: [
                          _iconButton(
                            context,
                            CupertinoIcons.share,
                          ),
                          SizedBox(
                            width: context.setWidth(5),
                          ),
                          _iconButton(
                            context,
                            IconlyBroken.heart,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 10,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _iconWithText(context, IconlyBold.camera, '5'),
                      SizedBox(
                        width: context.setMinSize(3),
                      ),
                      _iconWithText(context, IconlyBold.home, 'Ecole')
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconButton(
    BuildContext context,
    IconData icon,
  ) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        icon,
        color: darkGreyColor,
      ),
      style: ButtonStyle(
        iconSize: WidgetStatePropertyAll(
          context.setMinSize(20),
        ),
        backgroundColor: const WidgetStatePropertyAll(whiteColor),
        fixedSize: WidgetStatePropertyAll(
          Size(
            context.setWidth(45),
            context.setHeight(45),
          ),
        ),
      ),
    );
  }

  Widget _iconWithText(BuildContext context, IconData icon, String text) {
    return Container(
      padding: EdgeInsets.all(context.setMinSize(3)),
      decoration: BoxDecoration(
        color: darkGreyColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          SizedBox(
            width: context.setMinSize(5),
          ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: whiteColor),
          )
        ],
      ),
    );
  }
}
