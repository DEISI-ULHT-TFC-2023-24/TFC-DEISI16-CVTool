import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfc_versaofinal/utils/constants/sizes.dart';
import 'package:tfc_versaofinal/utils/constants/text_strings.dart';
import '../../../../../common/widgets/login/form_divider.dart';
import '../business/business_signup.dart';
import '../private/widgets/signup_form.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});


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
              Text(TFCTexts.signUpTitle1,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TFCSizes.spaceBtwSections),

              // Form
              const SignUpForm(),
              const SizedBox(height: TFCSizes.spaceBtwItems),

              // Divider
              const FormDivider(dividerText: TFCTexts.business),
              const SizedBox(height: TFCSizes.spaceBtwItems),

              // Business Register
              // SignUp Button
              SizedBox(width: double.infinity ,child: OutlinedButton(onPressed: () => Get.to(() => const SignupBusinessScreen()), child: const Text(TFCTexts.businessRegister))),
              const SizedBox(height: TFCSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}


