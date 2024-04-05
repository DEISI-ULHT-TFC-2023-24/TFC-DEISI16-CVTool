import 'package:flutter/material.dart';
import 'package:tfc_versaofinal/utils/constants/image_strings.dart';
import 'package:tfc_versaofinal/utils/constants/sizes.dart';
import 'package:tfc_versaofinal/utils/constants/text_strings.dart';
import 'package:tfc_versaofinal/utils/helpers/helper_functions.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });


  @override
  Widget build(BuildContext context) {

    final dark = TFCHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(dark
              ? TFCImages.darkThemeAppLogoCircular
              : TFCImages.lightThemeAppLogoCircular),
        ),
        const SizedBox(height: TFCSizes.spaceBtwItems),
        Text(TFCTexts.loginTitle1,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: TFCSizes.m),
        Text(TFCTexts.loginSubTitle1,
            style: Theme.of(context).textTheme.headlineSmall),
      ],
    );
  }
}