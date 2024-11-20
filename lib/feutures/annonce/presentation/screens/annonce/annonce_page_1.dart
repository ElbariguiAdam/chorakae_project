import 'package:chorakae_project/core/base/blocs/local/app_localization.dart';
import 'package:chorakae_project/core/base/blocs/local/localization_cubit.dart';
import 'package:chorakae_project/core/base/blocs/local/localization_state.dart';
import 'package:chorakae_project/core/base/widgets/label_drop_down.dart';
import 'package:chorakae_project/core/base/widgets/label_text_field.dart';
import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:iconly/iconly.dart';

class AnnoncePage1 extends StatelessWidget {
  const AnnoncePage1({
    super.key,
    required this.nomController,
    required this.context,
    required QuillController controller,
  }) : _controller = controller;

  final TextEditingController nomController;
  final BuildContext context;
  final QuillController _controller;

  @override
  Widget build(BuildContext context) {
    bool isdark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      child: Column(
        children: [
          LabeledTextField(
            labelKey: "form_annonce.nom",
            controller: nomController,
            icon: IconlyLight.profile,
          ),
          LabelDropDown(
            icon: IconlyLight.location,
            labelKey: "form_annonce.Etat",
            hintText: "form_annonce.Etat".tr(context),
            items: const ["Casablanca_settat", "Guelmim_ouad_noun"],
            onChanged: (value) {},
            selectedItem: 'Casablanca_settat',
          ),
          LabelDropDown(
            icon: IconlyLight.location,
            labelKey: "form_annonce.ville",
            hintText: "form_annonce.ville".tr(context),
            items: const ["Casablanca", "Guelmim"],
            onChanged: (value) {},
            selectedItem: 'Casablanca',
          ),
          LabelDropDown(
            icon: IconlyLight.work,
            labelKey: "form_annonce.Activité_commerciale",
            hintText: "form_annonce.Activité_commerciale".tr(context),
            items: const [
              "Fournir des services",
              "Commerce et affaires",
              "Commerce électronique",
              "Soutien à l'industrie",
              "Immobilier"
            ],
            onChanged: (value) {},
            selectedItem: 'Fournir des services',
          ),
          LabelDropDown(
            icon: IconlyLight.work,
            labelKey: "form_annonce.type",
            hintText: "form_annonce.type".tr(context),
            items: const ["Entreprise", "Franchise", "Partenariat"],
            onChanged: (value) {},
            selectedItem: 'Entreprise',
          ),
          LabelDropDown(
            icon: IconlyLight.document,
            labelKey: "form_annonce.Type_vérification",
            hintText: "form_annonce.Type_vérification".tr(context),
            items: const [
              "Aucune vérification",
              "Documents légaux ...",
              "Dépôts légaux,....",
              "Légal + Commercial .."
            ],
            onChanged: (value) {},
            selectedItem: 'Aucune vérification',
          ),
          BlocBuilder<LocaleCubit, ChangeLocaleState>(
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.only(top: context.setMinSize(25)),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(context.setMinSize(8)),
                      decoration: BoxDecoration(
                        color: isdark ? whileColor20 : Colors.grey[200],
                        borderRadius:
                            BorderRadius.circular(context.setMinSize(10)),
                      ),
                      child: QuillToolbar.simple(
                        configurations: QuillSimpleToolbarConfigurations(
                          controller: _controller,
                          sharedConfigurations: QuillSharedConfigurations(
                            locale: state.locale,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(context.setMinSize(10)),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isdark ? whileColor10 : lightGreyColor,
                          border: Border.all(color: whileColor80),
                          borderRadius:
                              BorderRadius.circular(context.setMinSize(12)),
                          boxShadow: [
                            BoxShadow(
                              color: isdark ? whileColor10 : lightGreyColor,
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: context.setMinSize(16),
                              vertical: context.setMinSize(14)),
                          child: QuillEditor.basic(
                            configurations: QuillEditorConfigurations(
                              placeholder: "Type here...",
                              controller: _controller,
                              autoFocus: false,
                              padding: EdgeInsets.symmetric(
                                  vertical: context.setMinSize(10),
                                  horizontal: context.setMinSize(10)),
                              sharedConfigurations: QuillSharedConfigurations(
                                locale: state.locale,
                              ),
                              minHeight: context.setMinSize(200),
                              maxHeight: context.setMinSize(500),
                              textSelectionThemeData: TextSelectionThemeData(
                                cursorColor: blueColor,
                                selectionColor: blueColor.withOpacity(0.5),
                                selectionHandleColor: blueColor,
                              ),
                              scrollBottomInset: 50,
                              enableInteractiveSelection: true,
                              showCursor: true,
                              textCapitalization: TextCapitalization.sentences,
                              keyboardAppearance: Brightness.dark,
                              scrollPhysics: const BouncingScrollPhysics(),
                              floatingCursorDisabled: false,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
