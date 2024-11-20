import 'package:chorakae_project/core/base/blocs/local/app_localization.dart';
import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/device_utils.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class AnnoncePage3 extends StatelessWidget {
  const AnnoncePage3({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            '${'form_annonce.Images'.tr(context)}:',
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
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: whileColor80, width: 2),
                borderRadius: BorderRadius.circular(12),
                color: Colors.transparent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(IconlyLight.paper_plus, size: 32),
                  SizedBox(
                    height: context.setMinSize(4),
                  ),
                  Text(
                    'Ajouter',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: context.setMinSize(8),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: context.setMinSize(400),
            ),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 8,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: DeviceUtils.valueDecider<int>(
                  context,
                  onMobile: 3,
                  others: 4,
                ),
                mainAxisSpacing: context.setMinSize(10),
                crossAxisSpacing: context.setMinSize(10),
              ),
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: whileColor80, width: 2),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.transparent,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
