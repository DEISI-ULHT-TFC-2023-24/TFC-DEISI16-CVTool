import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfc_versaofinal/common/styles/spacing_styles.dart';
import 'package:tfc_versaofinal/features/authentication/screens/login/login.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';
import '../../../../../../utils/helpers/helper_functions.dart';


class SucessScreen extends StatelessWidget {
  const SucessScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TFCSpacingStyles.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
            // Top Image
            Image(image: const AssetImage(TFCImages.sucessImage1), width: TFCHelperFunctions.screenWidth() * 0.6),
            const SizedBox(height: TFCSizes.spaceBtwItems),

            // Title and Subtitle
            Text(TFCTexts.sucessTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
            const SizedBox(height: TFCSizes.spaceBtwItems),
            Text(TFCTexts.sucessSubTitle, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
            const SizedBox(height: TFCSizes.spaceBtwSections),
              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const LoginScreen());
                  },
                  child: const Text(TFCTexts.continueMsg),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
