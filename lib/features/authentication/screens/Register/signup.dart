import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
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
            children: [
              // Title
              Text(TFCTexts.signUpTitle1,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TFCSizes.spaceBtwSections),

              // Form
              Form(
                child: Column(
                  children: [
                    // First and Last name
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: const InputDecoration(labelText: TFCTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                          ),
                        ),
                        const SizedBox(width: TFCSizes.spaceBtwInputFields),
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: const InputDecoration(labelText: TFCTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                          ),
                        ),
                      ],
                    ),
                    // Username
                    // Password
                    // Email
                    // Phone Number

                    // Terms agree button

                    // SignUp Button
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
