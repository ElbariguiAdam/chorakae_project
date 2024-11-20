import 'package:chorakae_project/core/base/blocs/local/app_localization.dart';
import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:chorakae_project/feutures/annonce/presentation/widgets/annonce/annonce_card.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(context.setMinSize(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: context.setMinSize(15), top: context.setMinSize(15)),
              child: Text(
                "main_view.favorit".tr(context),
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: blueColor),
              ),
            ),
            SizedBox(height: context.setMinSize(5)),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.all(8.0),
                child: AnnonceCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
