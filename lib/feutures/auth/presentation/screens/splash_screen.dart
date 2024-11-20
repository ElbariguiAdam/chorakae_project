import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:chorakae_project/feutures/auth/presentation/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

import '../../../../core/constants/app_images_path/app_images_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    bool isdark = Theme.of(context).brightness == Brightness.dark;

    return FlutterSplashScreen.scale(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          isdark ? darkGreyColor : whiteColor,
          isdark ? darkGreyColor : whiteColor,
        ],
      ),
      childWidget: SizedBox(
        // height: context.setHeight(250),
        width: context.setWidth(90),
        child: Image.asset(
          AppImagesPath.kAppLogo,
          fit: BoxFit.cover,
        ),
      ),
      duration: const Duration(milliseconds: 2000),
      animationDuration: const Duration(milliseconds: 1500),
      onAnimationEnd: () => debugPrint("On Scale End"),
      nextScreen: const SignInScreen(),
    );
  }
}
