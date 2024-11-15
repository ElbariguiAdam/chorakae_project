import 'package:chorakae_project/core/base/blocs/local/app_localization.dart';
import 'package:chorakae_project/core/base/widgets/list_tile/divider_list_tile.dart';
import 'package:chorakae_project/core/constants/app_images_path/app_images_path.dart';
import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:chorakae_project/feutures/annonce/presentation/blocs/main_wrapper_bloc/main_wrapper_bloc.dart';
import 'package:chorakae_project/feutures/annonce/presentation/screens/annonce_page.dart';
import 'package:chorakae_project/feutures/annonce/presentation/widgets/costum_app_bar.dart';
import 'package:chorakae_project/feutures/annonce/presentation/widgets/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'pages.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  /// Top Level Pages
  final List<Widget> topLevelPages = const [
    HomePage(),
    FavoritePage(),
    NotificationsPage(),
    ProfilePage(),
  ];

  /// on Page Changed
  void onPageChanged(int page) {
    BlocProvider.of<BottomNavCubit>(context).changeSelectedIndex(page);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    bool isdark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      drawer: _drawer(context, isdark),
      appBar: _mainWrapperAppBar(_scaffoldKey),
      body: _mainWrapperBody(),
      bottomNavigationBar: _mainWrapperBottomNavBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _mainWrapperFab(),
    );
  }

  Drawer _drawer(BuildContext context, bool isdark) {
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
            child: const ProfileCard(
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
            press: () {},
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
            press: () {},
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

  // Bottom Navigation Bar - MainWrapper Widget
  BottomAppBar _mainWrapperBottomNavBar(BuildContext context) {
    bool isdark = Theme.of(context).brightness == Brightness.dark;

    return BottomAppBar(
      color: isdark ? whileColor10 : whiteColor,
      shadowColor: isdark ? whiteColor : darkGreyColor,
      elevation: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _bottomAppBarItem(
                  context,
                  defaultIcon: IconlyLight.home,
                  page: 0,
                  label: "main_view.home".tr(context),
                  filledIcon: IconlyBold.home,
                ),
                _bottomAppBarItem(
                  context,
                  defaultIcon: IconlyLight.heart,
                  page: 1,
                  label: "main_view.favorit".tr(context),
                  filledIcon: IconlyBold.heart,
                ),
                SizedBox(
                  width: context.setWidth(60),
                  height: context.setHeight(20),
                ),
                _bottomAppBarItem(
                  context,
                  defaultIcon: IconlyLight.notification,
                  page: 2,
                  label: "main_view.Notifications".tr(context),
                  filledIcon: IconlyBold.notification,
                ),
                _bottomAppBarItem(
                  context,
                  defaultIcon: IconlyLight.profile,
                  page: 3,
                  label: "main_view.Compte".tr(context),
                  filledIcon: IconlyBold.profile,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Floating Action Button - MainWrapper Widget
  FloatingActionButton _mainWrapperFab() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const AnnoncePage(),
          ),
        );
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      backgroundColor: blueColor,
      child: const Icon(Icons.add),
    );
  }

  // App Bar - MainWrapper Widget
  PreferredSizeWidget _mainWrapperAppBar(GlobalKey<ScaffoldState> scaffoldKey) {
    return CostumAppBar(
      scaffoldKey: scaffoldKey,
    );
  }

  // Body - MainWrapper Widget
  PageView _mainWrapperBody() {
    return PageView(
      allowImplicitScrolling: true,
      // physics: NeverScrollableScrollPhysics(),
      onPageChanged: (int page) => onPageChanged(page),
      controller: pageController,
      children: topLevelPages,
    );
  }

  // Bottom Navigation Bar Single item - MainWrapper Widget
  Widget _bottomAppBarItem(
    BuildContext context, {
    required defaultIcon,
    required page,
    required label,
    required filledIcon,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<BottomNavCubit>(context).changeSelectedIndex(page);

          pageController.animateToPage(page,
              duration: const Duration(milliseconds: 10),
              curve: Curves.fastLinearToSlowEaseIn);
        },
        child: Container(
          color: trans,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: context.setHeight(10),
              ),
              Icon(
                context.watch<BottomNavCubit>().state == page
                    ? filledIcon
                    : defaultIcon,
                color: context.watch<BottomNavCubit>().state == page
                    ? blueColor
                    : whileColor60,
                size: context.setMinSize(26),
              ),
              SizedBox(
                height: context.setHeight(2),
              ),
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.aBeeZee(
                    color: context.watch<BottomNavCubit>().state == page
                        ? blueColor
                        : whileColor60,
                    fontSize: context.setHeight(13),
                    fontWeight: context.watch<BottomNavCubit>().state == page
                        ? FontWeight.w600
                        : FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
