import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tfc_versaofinal/utils/constants/sizes.dart';
import 'package:tfc_versaofinal/utils/constants/text_strings.dart';
import '../../../../../users/business/business_navigation_bar.dart';
import '../../../../../users/business/models/business_user_model.dart';
import '../../../../../users/private/models/private_user_model.dart';
import '../../../../../users/private/navigation_bar.dart';
import '../../register/private/signup.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late final PrivateUser? user;
  bool isObscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TFCSizes.spaceBtwSections),
        child: Column(
          children: [
            // User
            TextFormField(
              controller: _usernameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Introduza o seu nome de utilizador';
                }
                return null;
              },
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TFCTexts.username)
            ),
            const SizedBox(height: TFCSizes.spaceBtwInputFields),

            // Password
            TextFormField(
              controller: _passwordController,
              obscureText: isObscurePassword, // Use the variable to control password visibility
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Introduza a sua palavra-passe';
                }
                return null;
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: TFCTexts.password,
                // Change the suffix icon based on password visibility
                suffixIcon: IconButton(
                  onPressed: () {
                    // Toggle the password visibility when the button is pressed
                    setState(() {
                      isObscurePassword = !isObscurePassword;
                    });
                  },
                  icon: Icon(isObscurePassword ? Iconsax.eye_slash : Iconsax.eye),
                ),
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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final String enteredUsername = _usernameController.text;
                    final String enteredPassword = _passwordController.text;


                    // Find the PrivateUser
                    PrivateUser? privateUser;
                    for (var user in PrivateUser.main_private_users) {
                      if (user.username == enteredUsername && user.password == enteredPassword) {
                        privateUser = user;
                        break;
                      }
                    }

                    // Find the BusinessUser
                    BusinessUser? businessUser;
                    for (var user in BusinessUser.main_business_users) {
                      if (user.username == enteredUsername && user.password == enteredPassword) {
                        businessUser = user;
                        break;
                      }
                    }

                    if (businessUser != null) {
                      BusinessUser? businessUser = BusinessUser.getBusinessUserByUsername(enteredUsername);
                      Get.to(() => BusinessNavigationBarMenu(user: businessUser));

                    } else if (privateUser != null) {
                      PrivateUser? privateUser = PrivateUser.getPrivateUserByUsername(enteredUsername);
                      Get.to(() => NavigationBarMenu(user: privateUser));

                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('O seu utilizador ou password estão incorretos.'),
                        ),
                      );
                    }
                  }
                },
                child: const Text(TFCTexts.login),
              ),
            ),
            const SizedBox(height: TFCSizes.spaceBtwItems),

            // Create a new account
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(TFCTexts.createAccount),
              ),
            ),
            const SizedBox(height: TFCSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}

