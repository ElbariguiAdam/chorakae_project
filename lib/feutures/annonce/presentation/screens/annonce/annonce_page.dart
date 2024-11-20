import 'package:chorakae_project/core/base/widgets/primary_button.dart';
import 'package:chorakae_project/core/constants/app_images_path/app_images_path.dart';
import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:chorakae_project/feutures/annonce/presentation/widgets/profile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnnoncePage extends StatelessWidget {
  final bool isPreview;
  const AnnoncePage({super.key, this.isPreview = false});

  @override
  Widget build(BuildContext context) {
    bool isdark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _sliderStack(context),
              _postedBySection(context, isdark)
            ],
          ),
        ),
      ),
    );
  }

  Stack _sliderStack(BuildContext context) {
    return Stack(
      children: [
        _imageSlider(context),
        _appBar(context),
        Positioned(
          bottom: 5,
          left: 10,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _iconWithText(context, IconlyBold.camera, '5'),
              SizedBox(
                width: context.setMinSize(3),
              ),
              _iconWithText(context, IconlyBold.home, 'Ecole')
            ],
          ),
        ),
      ],
    );
  }

  Padding _postedBySection(BuildContext context, bool isdark) {
    return Padding(
      padding: EdgeInsets.all(context.setMinSize(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _discription(context, isdark),
          Divider(
            height: 1,
            color: whileColor80.withOpacity(0.5),
          ),
          SizedBox(
            height: context.setHeight(10),
          ),
          Text(
            'Posted By:',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: isdark ? whiteColor : darkGreyColor,
                ),
          ),
          SizedBox(
            height: context.setHeight(5),
          ),
          ProfileCard(
            isdark: isdark,
            email: 'elbariguiadam@gmail.com',
            isPro: true,
            name: 'Adam',
            isShowArrow: false,
            imageSrc:
                'https://th.bing.com/th/id/OIP.IGNf7GuQaCqz_RPq5wCkPgHaLH?rs=1&pid=ImgDetMain',
            isShowHi: false,
          ),
          _postedBySectionRow(
              context, isdark, IconlyLight.calendar, "Member depuis 2012"),
          _postedBySectionRow(
              context, isdark, CupertinoIcons.globe, "Https://example.com",
              setBlue: true),
          _postedBySectionRow(
              context, isdark, IconlyLight.location, "Casablanca-settat"),
          SizedBox(
            height: context.setHeight(10),
          ),
          Text(
            'Prix:',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: isdark ? whiteColor : darkGreyColor,
                ),
          ),
          SizedBox(
            height: context.setHeight(10),
          ),
          Text(
            '1M - 3M DHS',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: blueColor,
                ),
          ),
          SizedBox(
            height: context.setHeight(25),
          ),
          _contactSection(context, isdark),
        ],
      ),
    );
  }

  Row _contactSection(BuildContext context, bool isdark) {
    return Row(
      children: [
        _mediaContainer(
          context,
          isdark,
          child: SvgPicture.asset(
            height: context.setHeight(30),
            width: context.setWidth(30),
            AppImagesPath.kWhatsap,
            color: const Color.fromARGB(255, 4, 255, 108),
          ),
          color: const Color.fromARGB(255, 77, 206, 131),
        ),
        SizedBox(
          width: context.setWidth(5),
        ),
        _mediaContainer(
          context,
          isdark,
          child: Icon(
            IconlyLight.message,
            size: context.setMinSize(30),
            color: blueColor,
          ),
          color: blueColor90,
        ),
        Expanded(
          child: PrimaryButton(
            elevation: 0,
            onTap: () {},
            text: 'Appeler',
            bgColor: blueColor,
            borderRadius: 20,
            height: context.setHeight(50),
            width: double.infinity,
            textColor: whiteColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _mediaContainer(BuildContext context, bool isdark,
      {Widget? child, Color color = whileColor80}) {
    return Container(
      padding: EdgeInsets.all(context.setMinSize(8)),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: child,
    );
  }

  Padding _postedBySectionRow(
      BuildContext context, bool isdark, IconData icon, String text,
      {bool setBlue = false}) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.setWidth(10),
        left: context.setWidth(10),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(context.setMinSize(5)),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: greyColor,
            ),
            child: Icon(
              icon,
              size: context.setMinSize(18),
              color: setBlue ? blueColor : whiteColor,
            ),
          ),
          SizedBox(
            width: context.setWidth(5),
          ),
          Text(
            text,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: setBlue
                      ? blueColor
                      : isdark
                          ? whiteColor
                          : darkGreyColor,
                ),
          ),
        ],
      ),
    );
  }

  Padding _appBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.setMinSize(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _iconButton(
            context,
            IconlyLight.arrow_left,
            onPressed: () {
              if (!isPreview) {
                Navigator.pop(context);
              }
            },
          ),
          Row(
            children: [
              _iconButton(context, CupertinoIcons.share),
              SizedBox(
                width: context.setWidth(5),
              ),
              _iconButton(context, IconlyBroken.heart),
            ],
          )
        ],
      ),
    );
  }

  Skeletonizer _imageSlider(BuildContext context) {
    return Skeletonizer(
      enabled: false,
      child: ImageSlideshow(
        width: double.infinity,
        height: context.setHeight(250),
        initialPage: 0,
        indicatorColor: blueColor,
        indicatorBackgroundColor: whileColor60,
        onPageChanged: (value) {
          print('Page changed: $value');
        },
        autoPlayInterval: null,
        isLoop: false,
        children: [
          Image.network(
            'https://th.bing.com/th/id/OIP.WzD0UWk6lDY8YpZaCkqJ2QHaEZ?rs=1&pid=ImgDetMain',
            fit: BoxFit.cover,
          ),
          Image.network(
            'https://querysprout.com/wp-content/uploads/2022/03/Untitled-design-53-3.jpg',
            fit: BoxFit.cover,
          ),
          Image.network(
            'https://th.bing.com/th/id/OIP.nAd5EeHQ6rQBNIoC1hwxtgHaE7?rs=1&pid=ImgDetMain',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  RichText _discription(BuildContext context, bool isdark) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        text:
            "Opportunité exceptionnelle pour les professionnels de la boulangerie ou les investisseurs ! Cette boulangerie/pâtisserie bien établie est située dans un quartier dynamique de Casablanca, offrant une clientèle fidèle et un fort potentiel de développement.\n\n",
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: isdark ? whiteColor : darkGreyColor,
            ),
        children: <TextSpan>[
          TextSpan(
            text: "Détails de l'Opportunité:\n\n",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isdark ? whiteColor : darkGreyColor,
                ),
          ),
          TextSpan(
            text:
                "• Emplacement : Quartier passant, excellente visibilité, proche des commerces et des écoles.\n",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: isdark ? whiteColor : darkGreyColor,
                ),
          ),
          TextSpan(
            text:
                "• Superficie : [indiquez la superficie] m² avec espace de vente, fournil et atelier de pâtisserie.\n",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: isdark ? whiteColor : darkGreyColor,
                ),
          ),
          TextSpan(
            text:
                "• Équipement : Matériel professionnel en bon état (four, pétrin, chambre de fermentation, etc.).\n",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: isdark ? whiteColor : darkGreyColor,
                ),
          ),
          TextSpan(
            text:
                "• Clientèle : Régulière, composée de particuliers et de professionnels (cafés, restaurants).\n",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: isdark ? whiteColor : darkGreyColor,
                ),
          ),
          TextSpan(
            text:
                "• Atouts : Recettes exclusives, possibilité d’élargir la gamme de produits, développement de services de livraison.\n",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: isdark ? whiteColor : darkGreyColor,
                ),
          ),
        ],
      ),
    );
  }

  Widget _iconButton(BuildContext context, IconData icon,
      {void Function()? onPressed}) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: darkGreyColor,
      ),
      style: ButtonStyle(
        iconSize: WidgetStatePropertyAll(
          context.setMinSize(20),
        ),
        backgroundColor: const WidgetStatePropertyAll(whiteColor),
        fixedSize: WidgetStatePropertyAll(
          Size(
            context.setWidth(45),
            context.setHeight(45),
          ),
        ),
      ),
    );
  }

  Widget _iconWithText(BuildContext context, IconData icon, String text) {
    return Container(
      padding: EdgeInsets.all(context.setMinSize(5)),
      decoration: BoxDecoration(
        color: darkGreyColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: whiteColor,
            size: context.setMinSize(20),
          ),
          SizedBox(
            width: context.setMinSize(5),
          ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: whiteColor),
          )
        ],
      ),
    );
  }
}
