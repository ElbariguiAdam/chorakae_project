// Networking and APIs

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
