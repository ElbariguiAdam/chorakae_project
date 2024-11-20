import 'package:chorakae_project/core/base/blocs/local/app_localization.dart';
import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:chorakae_project/feutures/annonce/presentation/blocs/main_wrapper_bloc/main_wrapper_bloc.dart';
import 'package:chorakae_project/feutures/annonce/presentation/screens/annonce/add_annonce.dart';
import 'package:chorakae_project/feutures/annonce/presentation/widgets/costum_app_bar.dart';
import 'package:chorakae_project/feutures/annonce/presentation/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'pages_export.dart';

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

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        drawer: MainDrawer(
          isdark: isdark,
        ),
        appBar: _mainWrapperAppBar(_scaffoldKey),
        body: _mainWrapperBody(),
        bottomNavigationBar: _mainWrapperBottomNavBar(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _mainWrapperFab(),
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
              builder: (context) => const AddAnnonce(),
            ));
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
