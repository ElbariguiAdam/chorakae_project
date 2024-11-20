import 'package:chorakae_project/core/base/blocs/local/app_localization.dart';
import 'package:chorakae_project/core/base/blocs/local/localization_cubit.dart';
import 'package:chorakae_project/core/base/widgets/list_tile/divider_list_tile.dart';
import 'package:chorakae_project/core/constants/app_images_path/app_images_path.dart';
import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:chorakae_project/feutures/annonce/presentation/screens/profile_details_page.dart';
import 'package:chorakae_project/feutures/annonce/presentation/widgets/language_choice.dart';
import 'package:chorakae_project/feutures/annonce/presentation/widgets/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';

class MainDrawer extends StatelessWidget {
  final bool isdark;
  const MainDrawer({
    super.key,
    required this.isdark,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(
              bottom: context.setMinSize(25),
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://www.swissprint.com/wp-content/uploads/2024/11/IMG_1455-1024x768.jpeg'))),
            width: double.infinity,
            height: context.setHeight(220),
            child: ProfileCard(
              isdark: isdark,
              isDrwaer: true,
              email: 'elbariguiadam@gmail.com',
              isPro: true,
              name: 'Adam',
              isShowArrow: false,
              imageSrc:
                  'https://th.bing.com/th/id/OIP.IGNf7GuQaCqz_RPq5wCkPgHaLH?rs=1&pid=ImgDetMain',
              isShowHi: true,
            ),
          ),
          DividerListTile(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileDetailsPage(),
                ),
              );
            },
            title: Text(
              "menu.Mon_profile".tr(context),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: isdark ? whileColor80 : whileColor20,
                  ),
            ),
            leading: const Icon(
              IconlyLight.profile,
            ),
            // isShowDivider: false,
            isShowForwordArrow: true,
          ),
          DividerListTile(
            press: () {},
            title: Text(
              "menu.Franchise".tr(context),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: isdark ? whileColor80 : whileColor20,
                  ),
            ),
            leading: SvgPicture.asset(
              AppImagesPath.kFranchise,
              height: context.setHeight(30),
              width: context.setWidth(30),
              color: isdark ? whiteColor : whileColor10,
            ),
            // isShowDivider: false,
            isShowForwordArrow: true,
          ),
          DividerListTile(
            press: () {},
            title: Text(
              "menu.Petits_projets_partenaires".tr(context),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: isdark ? whileColor80 : whileColor20,
                  ),
            ),
            leading: SvgPicture.asset(
              AppImagesPath.kPetitsprojets,
              height: context.setHeight(30),
              width: context.setWidth(30),
              color: isdark ? whiteColor : whileColor10,
            ),
            // isShowDivider: false,
            isShowForwordArrow: true,
          ),
          DividerListTile(
            press: () {},
            title: Text(
              "menu.Formation_conseil_ressources".tr(context),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: isdark ? whileColor80 : whileColor20,
                  ),
            ),
            leading: SvgPicture.asset(
              AppImagesPath.kFormationressources,
              height: context.setHeight(30),
              width: context.setWidth(30),
              color: isdark ? whiteColor : whileColor10,
            ),
            // isShowDivider: false,
            isShowForwordArrow: true,
          ),
          DividerListTile(
            press: () async {
              final selectedLanguage = await showLanguageChoiceDialog(
                context,
              );
              if (selectedLanguage != null) {
                context.read<LocaleCubit>().changeLanguage(selectedLanguage);
              }
            },
            title: Text(
              "menu.language".tr(context),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: isdark ? whileColor80 : whileColor20,
                  ),
            ),
            leading: SvgPicture.asset(
              AppImagesPath.kLanguage,
              height: context.setHeight(25),
              width: context.setWidth(25),
              color: isdark ? whiteColor : whileColor10,
            ),
            // isShowDivider: false,
            isShowForwordArrow: true,
          ),
          DividerListTile(
            press: () {},
            title: Text(
              "menu.Contacter nous".tr(context),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: isdark ? whileColor80 : whileColor20,
                  ),
            ),
            leading: const Icon(
              IconlyLight.call,
            ),
            // isShowDivider: false,
            isShowForwordArrow: true,
          ),
          DividerListTile(
            press: () {},
            title: Text(
              "menu.informations".tr(context),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: isdark ? whileColor80 : whileColor20,
                  ),
            ),
            leading: const Icon(
              IconlyLight.info_circle,
            ),
            // isShowDivider: false,
            isShowForwordArrow: true,
          ),
        ],
      ),
    );
  }
}
