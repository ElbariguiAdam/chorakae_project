import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:chorakae_project/feutures/annonce/presentation/widgets/card_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class AnnonceCard extends StatelessWidget {
  const AnnonceCard({super.key});

  @override
  Widget build(BuildContext context) {
    bool isdark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        
      },
      child: Card(
        elevation: 2,
        color: isdark ? darkGreyColor : whiteColor,
        child: Padding(
          padding: EdgeInsets.all(context.setMinSize(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CardImage(),
              SizedBox(height: context.setMinSize(5)),
              Row(
                children: [
                  const Icon(
                    size: 20,
                    IconlyLight.location,
                    color: whileColor60,
                  ),
                  Text(
                    "localisation",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: whileColor60,
                        ),
                  ),
                ],
              ),
              SizedBox(height: context.setMinSize(5)),
              Text(
                "Soutien à l'industrie",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: whileColor60,
                    ),
              ),
              SizedBox(height: context.setMinSize(5)),
              Text(
                "Factory for Sale: Prime Plastic P...",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: isdark ? greyColor : darkGreyColor,
                    ),
              ),
              SizedBox(height: context.setMinSize(5)),
              Text(
                "Description: A fully operational plastic manufacturing facility is now available for sale.This st...",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: whileColor60,
                    ),
              ),
              SizedBox(height: context.setMinSize(5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "30M - Illimité DHS",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: blueColor),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: errorColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(
                      context.setMinSize(5),
                    ),
                    child: const Icon(
                      IconlyLight.heart,
                      color: errorColor,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
