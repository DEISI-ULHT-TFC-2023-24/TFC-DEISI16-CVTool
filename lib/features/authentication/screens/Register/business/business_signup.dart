import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:tfc_versaofinal/features/authentication/screens/register/business/widgets/businesssignup_form.dart';
import 'package:tfc_versaofinal/utils/constants/sizes.dart';
import 'package:tfc_versaofinal/utils/constants/text_strings.dart';
import '../../../../../common/widgets/login/form_divider.dart';
import '../private/signup.dart';


class SignupBusinessScreen extends StatelessWidget {
  const SignupBusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TFCSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(TFCTexts.signUpTitle2,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TFCSizes.spaceBtwSections),

              // Form
              const BusinessSignUpForm(),
              const SizedBox(height: TFCSizes.spaceBtwItems),

              // Divider
              const FormDivider(dividerText: TFCTexts.business),
              const SizedBox(height: TFCSizes.spaceBtwItems),

              // Business Register
              // SignUp Button
              SizedBox(width: double.infinity ,child: OutlinedButton(onPressed: () => Get.to(() => const SignupScreen()), child: const Text(TFCTexts.privateRegister))),
              const SizedBox(height: TFCSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}


