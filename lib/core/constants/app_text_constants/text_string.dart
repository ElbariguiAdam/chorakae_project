// Networking and APIs

import 'package:chorakae_project/core/base/blocs/local/app_localization.dart';
import 'package:chorakae_project/core/constants/app_images_path/app_images_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_field_validator/form_field_validator.dart';

const String baseUrl = 'https://bitbot.42web.io';
const String endpointUrl = '/wp-json/wc/v3/';
const String categoriesEndpoint = 'products/categories';

const String consumerKey = 'ck_f57e33ac41088ea5ac1c71ee9657d4fd6767a10b';

const String consumerSecret = 'cs_4800c468ee12a44914acf6edadf531d879009c77';

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'Password is required'),
  MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
  PatternValidator(r'(?=.*?[#?!@$%^&*-])',
      errorText: 'passwords must have at least one special character')
]);

final emaildValidator = MultiValidator([
  RequiredValidator(errorText: 'Email is required'),
  EmailValidator(errorText: "Enter a valid email address"),
]);

List<String> getListOfCategories(BuildContext context) {
  List<String> categories = [
    "Home_screen.Agriculture_sylviculture".tr(context),
    "Home_screen.Autres_activités".tr(context),
    "Home_screen.Commerce_électronique".tr(context),
    "Home_screen.Commerce_affaires".tr(context),
    "Home_screen.Éducation".tr(context),
    "Home_screen.Hébergement_restauration_café".tr(context),
    "Home_screen.Immobilier".tr(context),
    "Home_screen.Santé".tr(context),
    "Home_screen.Services_soutien_entreprises".tr(context),
    "Home_screen.Soutien_l'industrie".tr(context),
    "Home_screen.Technologie et communications".tr(context),
    "Home_screen.Fournir des services".tr(context),
    "Home_screen.Véhicules_Transport_Logistique".tr(context),
  ];

  return categories;
}

List<String> getListOfCategoriesIcons() {
  List<String> categories = [
    AppImagesPath.kAgriculture,
    AppImagesPath.kAutreCa,
    AppImagesPath.kCommerce,
    AppImagesPath.kCommerceA,
    AppImagesPath.kEducation,
    AppImagesPath.kHebergement,
    AppImagesPath.kImmobilier,
    AppImagesPath.kSante,
    AppImagesPath.kServices,
    AppImagesPath.kSoutien,
    AppImagesPath.kTechnologie,
    AppImagesPath.kFournir,
    AppImagesPath.kVehicule,
  ];

  return categories;
}
