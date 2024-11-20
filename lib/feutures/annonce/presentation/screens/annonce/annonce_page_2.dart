import 'package:chorakae_project/core/base/blocs/local/app_localization.dart';
import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class AnnoncePage2 extends StatelessWidget {
  const AnnoncePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            '${'form_annonce.Registre_commercial'.tr(context)}:',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: context.setMinSize(8),
          ),
          Text(
            '${'form_annonce.Veuillez_télécharger'.tr(context)}:',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: context.setMinSize(8),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: whileColor80, width: 2),
                borderRadius: BorderRadius.circular(12),
                color: Colors.transparent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(IconlyLight.paper_upload, size: 32),
                  SizedBox(
                    height: context.setMinSize(4),
                  ),
                  Text(
                    'upload file!',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: context.setMinSize(120),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(IconlyLight.paper_fail, size: 32),
              Text(
                'no file was uploaded yet ttt',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }
}
