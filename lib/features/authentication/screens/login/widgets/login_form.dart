import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:tfc_versaofinal/utils/constants/sizes.dart';
import 'package:tfc_versaofinal/utils/constants/text_strings.dart';
import '../../../../../models/business_user.dart';
import '../../../../../models/normal_user.dart';
import '../../../../../repository/business_user_repository.dart';
import '../../../../../repository/normal_user_repository.dart';
import '../../../../../users/business/business_navigation_bar.dart';
import '../../../../../users/private/navigation_bar.dart';
import '../../recovery/recover_pass.dart';
import '../../register/private/signup.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late NormalUserRepository normalUserRepository;
  late BusinessUserRepository businessUserRepository;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isObscurePassword = true;

  @override
  void initState() {
    // TODO: implement initState
    normalUserRepository = context.read<NormalUserRepository>();
    businessUserRepository = context.read<BusinessUserRepository>();
    super.initState();
  }

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
                  labelText: TFCTexts.username),
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
                prefixIcon: const Icon(Iconsax.password_check),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RecoveryScreen()),
                    );
                  },
                  child: const Text(TFCTexts.forgetPassword),
                ),
              ],
            ),
            const SizedBox(height: TFCSizes.spaceBtwSections),

            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final String enteredUsername = _usernameController.text;
                    final String enteredPassword = _passwordController.text;

                    try {
                      // Chamada da API para validação do usuário normal
                      NormalUser? normalUser = await normalUserRepository.getUserAfterValidation(enteredUsername, enteredPassword);

                      // Chamada da API para validação do usuário empresarial
                      BusinessUser? businessUser = await businessUserRepository.getTheBusinessUserAfterValidation(enteredUsername, enteredPassword);

                      if (businessUser != null) {
                        Get.to(() => BusinessNavigationBarMenu(user: businessUser));
                      } else if (normalUser != null) {
                        Get.to(() => NavigationBarMenu(user: normalUser));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('O seu utilizador ou password estão incorretos.'),
                          ),
                        );
                      }
                    } catch (e) {
                      // Tratar erros da chamada da API
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Erro ao validar usuário: $e'),
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
