import 'dart:io';
import 'package:chorakae_project/core/base/blocs/local/app_localization.dart';
import 'package:chorakae_project/core/base/widgets/label_drop_down.dart';
import 'package:chorakae_project/core/base/widgets/label_text_field.dart';
import 'package:chorakae_project/core/base/widgets/primary_button.dart';
import 'package:chorakae_project/core/base/widgets/string_auto_complet.dart';
import 'package:chorakae_project/core/base/widgets/text_field_with_tags.dart';
import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:chorakae_project/feutures/annonce/presentation/blocs/pickimage/add_image_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:textfield_tags/textfield_tags.dart';

class ProfileDetailsPage extends StatefulWidget {
  const ProfileDetailsPage({super.key});

  @override
  State<ProfileDetailsPage> createState() => _ProfileDetailsPageState();
}

class _ProfileDetailsPageState extends State<ProfileDetailsPage> {
  TextEditingController nomController = TextEditingController();
  TextEditingController nomUtilisateurController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController entrepriseController = TextEditingController();
  StringTagController stringTagController = StringTagController();
  StringTagController textfieldTagsController = StringTagController();

  @override
  Widget build(BuildContext context) {
    bool isdark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        appBar: _appBar(context, isdark),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(context.setMinSize(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _avatar(),
                _editProfileForm(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context, bool isdark) {
    return AppBar(
        backgroundColor: trans,
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            IconlyLight.arrow_left_2,
            color: isdark ? whileColor80 : darkGreyColor,
          ),
        ),
      );
  }

  Padding _editProfileForm(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.setMinSize(8)),
      child: Form(
        child: Column(
          children: [
            LabeledTextField(
              labelKey: "profile_details.nom",
              controller: nomController,
              icon: IconlyLight.profile,
            ),
            LabeledTextField(
              labelKey: "profile_details.nom_utilisateur",
              controller: nomUtilisateurController,
              icon: IconlyLight.profile,
            ),
            LabelDropDown(
              icon: IconlyLight.call,
              labelKey: "profile_details.pays",
              hintText: "profile_details.pays".tr(context),
              items: const ["Moroco +212", "france +33"],
              onChanged: (value) {},
              selectedItem: 'Moroco +212',
            ),
            LabeledTextField(
              labelKey: "profile_details.numero",
              controller: numeroController,
              icon: IconlyLight.call,
            ),
            LabeledTextField(
              labelKey: "profile_details.mail",
              controller: mailController,
              icon: IconlyLight.message,
            ),
            LabelDropDown(
              icon: IconlyLight.location,
              labelKey: "profile_details.nationalite",
              hintText: "profile_details.nationalite".tr(context),
              items: const ["Moroco", "france"],
              onChanged: (value) {},
              selectedItem: 'Moroco',
            ),
            LabelDropDown(
              icon: CupertinoIcons.money_dollar,
              labelKey: "profile_details.gamme_inves",
              hintText: "profile_details.gamme_inves".tr(context),
              items: const ["250,000 - 1,000,000", "1,000,000 - 3,000,000"],
              onChanged: (value) {},
              selectedItem: "250,000 - 1,000,000",
            ),
            LabeledTextField(
              labelKey: "profile_details.profession",
              controller: professionController,
              icon: IconlyLight.document,
            ),
            StringAutoCompleteTags(
              labelKey: "profile_details.entreprise_prefere",
              listItems: listEntreprisePrefere,
              stringTagController: stringTagController,
            ),
            TextFieldWithTags(
              labelKey: "profile_details.entreprise_presente",
              hintText: "profile_details.entreprise_presente".tr(context),
              stringTagController: textfieldTagsController,
            ),
            SizedBox(height: context.setHeight(15)),
            PrimaryButton(
              elevation: 0,
              onTap: () {},
              text: "profile_details.enregistrer".tr(context),
              bgColor: blueColor,
              borderRadius: 20,
              height: context.setHeight(50),
              width: double.infinity,
              textColor: whiteColor,
              fontSize: 14,
            ),
          ],
        ),
      ),
    );
  }

  BlocBuilder<AddImageCubit, AddImageState> _avatar() {
    return BlocBuilder<AddImageCubit, AddImageState>(
      builder: (context, state) {
        if (state.image == null) {
          return CircleAvatar(
            radius: context.setMinSize(60),
            backgroundColor: Colors.grey.shade200,
            backgroundImage: const NetworkImage(
                'https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg'),
            child: Stack(
              children: [
                Positioned(
                  bottom: 1,
                  right: 10,
                  child: IconButton(
                    style: const ButtonStyle(
                      elevation: WidgetStatePropertyAll(2),
                      backgroundColor: WidgetStatePropertyAll(whiteColor),
                      shadowColor: WidgetStatePropertyAll(darkGreyColor),
                      shape: WidgetStatePropertyAll(
                        CircleBorder(),
                      ),
                    ),
                    onPressed: () {
                      context.read<AddImageCubit>().pickImage();
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: blueColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return CircleAvatar(
          radius: context.setMinSize(60),
          backgroundColor: Colors.grey.shade200,
          backgroundImage: FileImage(
            File(state.image!.path),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 1,
                right: 10,
                child: IconButton(
                  style: const ButtonStyle(
                    elevation: WidgetStatePropertyAll(2),
                    backgroundColor: WidgetStatePropertyAll(whiteColor),
                    shadowColor: WidgetStatePropertyAll(darkGreyColor),
                    shape: WidgetStatePropertyAll(
                      CircleBorder(),
                    ),
                  ),
                  onPressed: () {
                    context.read<AddImageCubit>().pickImage();
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: blueColor,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
