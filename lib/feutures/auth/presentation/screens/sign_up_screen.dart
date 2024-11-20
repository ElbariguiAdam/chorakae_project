import 'package:chorakae_project/core/base/blocs/local/app_localization.dart';
import 'package:chorakae_project/core/constants/app_images_path/app_images_path.dart';
import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:chorakae_project/feutures/auth/presentation/widgets/costum_rich_text.dart';
import 'package:chorakae_project/core/base/widgets/label_text_field.dart';
import 'package:chorakae_project/core/base/widgets/primary_button.dart';
import 'package:chorakae_project/feutures/auth/presentation/widgets/terms_and_privacy_text.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey signUpKey = GlobalKey();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController confirmPasswordC = TextEditingController();

  TextEditingController firstNameC = TextEditingController();
  TextEditingController lastNameC = TextEditingController();
  TextEditingController usernameC = TextEditingController();
  @override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    confirmPasswordC.dispose();
    firstNameC.dispose();
    lastNameC.dispose();
    usernameC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        appBar: _signUpAppBar(context, isDark),
        body: _signUpForm(context, isDark),
      ),
    );
  }

//------------------[App Bar]----------------------------//
  AppBar _signUpAppBar(BuildContext context, bool isDark) {
    return AppBar(
      backgroundColor: Colors.transparent,
      forceMaterialTransparency: true,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            IconlyLight.arrow_left_2,
            color: isDark ? whiteColor : darkGreyColor,
          )),
      elevation: 0,
    );
  }

//------------------[Sign Up Form]----------------------------//
  SingleChildScrollView _signUpForm(BuildContext context, bool isDark) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.setMinSize(25),
        ),
        child: Form(
          key: signUpKey,
          child: Column(
            children: [
              SizedBox(
                width: context.setWidth(90),
                child: Image.asset(
                  AppImagesPath.kAppLogo,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: context.setHeight(24)),
              Text(
                "sign_up_view.Sign_up_sub".tr(context),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: isDark ? lightGreyColor : whileColor20,
                    fontSize: 20),
              ),
              SizedBox(height: context.setHeight(36)),
              LabeledTextField(
                labelKey: "sign_up_view.prenom",
                controller: firstNameC,
                icon: IconlyLight.profile,
              ),
              SizedBox(height: context.setHeight(16)),
              LabeledTextField(
                labelKey: "sign_up_view.Nom_de_famille",
                controller: lastNameC,
                icon: IconlyLight.profile,
              ),
              SizedBox(height: context.setHeight(16)),
              LabeledTextField(
                labelKey: "sign_up_view.Nom_d'utilisateur",
                controller: usernameC,
                icon: IconlyLight.profile,
              ),
              SizedBox(height: context.setHeight(16)),
              LabeledTextField(
                labelKey: "sign_up_view.e_mail",
                controller: emailC,
                icon: IconlyLight.message,
              ),
              SizedBox(height: context.setHeight(16)),
              LabeledTextField(
                labelKey: "sign_up_view.Mot_de_passe",
                controller: passwordC,
                icon: IconlyLight.lock,
                isPassword: true,
              ),
              SizedBox(height: context.setHeight(16)),
              LabeledTextField(
                labelKey: "sign_up_view.confirm_password",
                controller: confirmPasswordC,
                icon: IconlyLight.lock,
                isPassword: true,
              ),
              SizedBox(height: context.setHeight(16)),
              PrivacyPolicyCheckbox(
                firstText: 'sign_up_view.I_agree_with_the'.tr(context),
                secondText: 'sign_up_view.privacy_policy'.tr(context),
              ),
              PrivacyPolicyCheckbox(
                firstText: 'sign_up_view.sabonner_la_newsletter'.tr(context),
              ),
              SizedBox(height: context.setHeight(16)),
              PrimaryButton(
                elevation: 0,
                onTap: () {},
                text: 'sign_up_view.sign_up'.tr(context),
                bgColor: blueColor,
                borderRadius: 20,
                height: context.setHeight(50),
                width: double.infinity,
                textColor: whiteColor,
                fontSize: 14,
              ),
              SizedBox(height: context.setHeight(24)),
              CostumRichText(
                title: 'sign_up_view.Do_you_have_an_account'.tr(context),
                subtitle: 'sign_up_view.go_Log_in'.tr(context),
                onTab: () {
                  Navigator.pop(
                    context,
                  );
                },
                subtitleTextStyle:
                    Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: blueColor,
                          fontWeight: FontWeight.w600,
                        ),
              ),
              SizedBox(height: context.setHeight(24)),
            ],
          ),
        ),
      ),
    );
  }
}
