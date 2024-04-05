import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tfc_versaofinal/common/styles/spacing_styles.dart';
import 'package:tfc_versaofinal/utils/constants/colors.dart';
import 'package:tfc_versaofinal/utils/constants/image_strings.dart';
import 'package:tfc_versaofinal/utils/constants/sizes.dart';
import 'package:tfc_versaofinal/utils/constants/text_strings.dart';
import 'package:tfc_versaofinal/utils/helpers/helper_functions.dart';

// Main Login Screen for private Users
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Checking if the app is on dark or light Theme mode
    final dark = TFCHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TFCSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Logo, Title and a Sub-title
              Column(
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
              ),

              // Form of the login
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: TFCSizes.spaceBtwSections),
                  child: Column(
                    children: [
                      // User
                      TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.direct_right),
                            labelText: TFCTexts.username),
                      ),
                      const SizedBox(height: TFCSizes.spaceBtwInputFields),

                      // Password
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.password_check),
                          labelText: TFCTexts.password,
                          suffixIcon: Icon(Iconsax.eye_slash),
                        ),
                      ),
                      const SizedBox(height: TFCSizes.spaceBtwInputFields),

                      // Remember me and Forget Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Remember me
                          Row(
                            children: [
                              Checkbox(value: true, onChanged: (value) {}),
                              const Text(TFCTexts.remember),
                            ],
                          ),
                          // Forget Password
                          TextButton(
                            onPressed: (){},
                            child: const Text(TFCTexts.forgetPassword),
                          ),
                        ],
                      ),
                      const SizedBox(height: TFCSizes.spaceBtwSections),

                      // Sign In Button
                      SizedBox(width: double.infinity ,child: ElevatedButton(onPressed: (){}, child: const Text(TFCTexts.login))),
                      const SizedBox(height: TFCSizes.spaceBtwItems),

                      // Create a new account
                      SizedBox(width: double.infinity ,child: OutlinedButton(onPressed: (){}, child: const Text(TFCTexts.createAccount))),
                      const SizedBox(height: TFCSizes.spaceBtwSections),
                    ],
                  ),
                ),
              ),

              // Divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Divider(color: dark ? TFCColors.darkerGrey: TFCColors.grey, thickness: 0.5, indent: 60, endIndent: 5),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
