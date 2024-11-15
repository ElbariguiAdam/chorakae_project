import 'package:chorakae_project/core/base/widgets/list_tile/divider_list_tile.dart';
import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:chorakae_project/feutures/annonce/presentation/widgets/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isdark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(context.setMinSize(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileCard(
              email: 'elbariguiadam@gmail.com',
              name: 'Adam',
              imageSrc:
                  'https://th.bing.com/th/id/OIP.IGNf7GuQaCqz_RPq5wCkPgHaLH?rs=1&pid=ImgDetMain',
              isShowHi: true,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: context.setMinSize(15),
                top: context.setMinSize(25),
                bottom: context.setMinSize(10),
              ),
              child: Text(
                "Shortcuts",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),

            DividerListTile(
              press: () {},
              title: Text(
                "Mes annonces",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: isdark ? whileColor80 : whileColor20,
                    ),
              ),
              isShowDivider: false,
              isShowForwordArrow: true,
            ),
            DividerListTile(
              press: () {},
              title: Text(
                "Mes Contracts",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: isdark ? whileColor80 : whileColor20,
                    ),
              ),
              isShowDivider: false,
              isShowForwordArrow: true,
            ),
            DividerListTile(
              press: () {},
              title: Text(
                "Modifier votre mot de passe",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: isdark ? whileColor80 : whileColor20,
                    ),
              ),
              icon: IconlyBroken.password,
              isShowDivider: false,
              isShowForwordArrow: true,
            ),
            DividerListTile(
              press: () {},
              title: Text(
                "Contactez nous",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: isdark ? whileColor80 : whileColor20,
                    ),
              ),
              icon: IconlyBroken.send,
              isShowDivider: false,
              isShowForwordArrow: true,
            ),
            DividerListTile(
              press: () {},
              title: Text(
                "Se deconnecter",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: isdark ? whileColor80 : whileColor20,
                    ),
              ),
              icon: IconlyBroken.logout,
              isShowDivider: false,
              isShowForwordArrow: true,
            ),
            SizedBox(
              height: context.setMinSize(25),
            ),
          ],
        ),
      ),
    );
  }
}
            // SizedBox(
            //   height: context.setMinSize(8),
            // ),
            // CustomTextField(
            //   controller: emailcontroller,
            //   hintText: 'E-mail',
            //   icon: IconlyLight.message,
            // ),
            // SizedBox(
            //   height: context.setMinSize(8),
            // ),
            // CustomTextField(
            //   controller: numbercontroller,
            //   hintText: 'Phone number',
            //   icon: IconlyLight.call,
            // ),
            // Divider(
            //   color: whileColor80.withOpacity(0.5),
            // ),