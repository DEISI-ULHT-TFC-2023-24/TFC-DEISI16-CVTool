import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tfc_versaofinal/features/authentication/screens/register/widgets/signup_form.dart';
import 'package:tfc_versaofinal/utils/constants/sizes.dart';
import 'package:tfc_versaofinal/utils/constants/text_strings.dart';


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
            ],
          ),
        ),
      ),
    );
  }
}


