import 'package:chorakae_project/core/base/blocs/local/app_localization.dart';
import 'package:chorakae_project/core/constants/app_images_path/app_images_path.dart';
import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:chorakae_project/feutures/annonce/presentation/screens/main_wrapper.dart';
import 'package:chorakae_project/core/base/widgets/costum_text_field.dart';
import 'package:chorakae_project/feutures/auth/presentation/screens/sign_up_screen.dart';
import 'package:chorakae_project/feutures/auth/presentation/widgets/costum_rich_text.dart';
import 'package:chorakae_project/core/base/widgets/primary_button.dart';
import 'package:chorakae_project/feutures/auth/presentation/widgets/primary_text_button.dart';
import 'package:chorakae_project/feutures/auth/presentation/widgets/terms_and_privacy_text.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  @override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isdark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.setMinSize(25),
            ),
            child: Column(
              children: [
                SizedBox(height: context.setHeight(90)),
                _loginTitles(context, isdark),
                _loginFrom(context, isdark),
              ],
            ),
          ),
        ),
      ),
    );
  }

//------------------[Titles]----------------------------//
  Column _loginTitles(BuildContext context, bool isdark) {
    return Column(
      children: [
        SizedBox(
          // height: context.setHeight(150),
          width: context.setWidth(90),
          child: Image.asset(
            AppImagesPath.kAppLogo,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: context.setHeight(24)),
        Text(
          "login_view.log_in_title".tr(context),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: isdark ? lightGreyColor : whileColor20, fontSize: 20),
        ),
        const SizedBox(height: 8),
        Text(
          "login_view.log_in_sub".tr(context),
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: isdark ? greyColor : whileColor40, fontSize: 14),
        ),
        const SizedBox(height: 36),
      ],
    );
  }

//------------------[Login Form]----------------------------//
  Form _loginFrom(BuildContext context, bool isdark) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "sign_up_view.e_mail".tr(context),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: isdark ? greyColor : whileColor40,
                fontWeight: FontWeight.w600,
                fontSize: 14),
          ),
          const SizedBox(
            height: 8,
          ),
          CustomTextField(
            controller: emailC,
            hintText: "sign_up_view.e_mail".tr(context),
            icon: IconlyLight.message,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "sign_up_view.Mot_de_passe".tr(context),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: isdark ? greyColor : whileColor40,
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(height: context.setHeight(8)),
          CustomTextField(
            controller: passwordC,
            hintText: "sign_up_view.Mot_de_passe".tr(context),
            icon: IconlyLight.lock,
            isPassword: true,
          ),
          SizedBox(height: context.setHeight(16)),
          Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  child: PrivacyPolicyCheckbox(
                firstText: 'login_view.remember_me'.tr(context),
              )),
              PrimaryTextButton(
                onPressed: () {},
                title: 'login_view.forgot_pass'.tr(context),
                textStyle: Theme.of(context).textTheme.titleSmall!,
              )
            ],
          ),
          SizedBox(height: context.setHeight(32)),
          PrimaryButton(
            elevation: 0,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const MainWrapper(),
                ),
              );
            },
            text: 'login_view.Log_in'.tr(context),
            bgColor: blueColor,
            borderRadius: 20,
            height: context.setHeight(50),
            width: double.infinity,
            textColor: whiteColor,
            fontSize: 14,
          ),
          SizedBox(
            height: context.setHeight(24),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: CostumRichText(
              title: 'login_view.Dont_have_an_account'.tr(context),
              subtitle: 'login_view.go_sign_up'.tr(context),
              onTab: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SignUpScreen(),
                  ),
                );
              },
              subtitleTextStyle:
                  Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: blueColor,
                        fontWeight: FontWeight.w600,
                      ),
            ),
          ),
          SizedBox(height: context.setHeight(24)),
        ],
      ),
    );
  }
}
