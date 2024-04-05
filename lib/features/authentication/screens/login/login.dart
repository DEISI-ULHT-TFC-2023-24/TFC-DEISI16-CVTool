import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tfc_versaofinal/common/styles/spacing_styles.dart';
import 'package:tfc_versaofinal/features/authentication/screens/login/widgets/login_form.dart';
import 'package:tfc_versaofinal/features/authentication/screens/login/widgets/login_header.dart';


// Main Login Screen for private Users
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Checking if the app is on dark or light Theme mode

    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TFCSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Logo, Title and a Sub-title
              LoginHeader(),

              // Form of the login
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}





