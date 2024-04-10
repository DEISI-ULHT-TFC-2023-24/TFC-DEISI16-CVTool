import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tfc_versaofinal/utils/constants/colors.dart';

import '../../../../features/authentication/screens/register/private/signup.dart';


class PrivateHomeScreen extends StatelessWidget {
  const PrivateHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hi, Dionísio!', style: TextStyle(color: TFCColors.textWhite),),
        centerTitle: false,
        backgroundColor: Colors.blue[600],

        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: TFCColors.white),
            onPressed: () => Get.to(() => const SignupScreen()),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text(
            'This is the private home screen content'), // Placeholder content
      ), // Replace with your actual content widgets
    );
  }
}