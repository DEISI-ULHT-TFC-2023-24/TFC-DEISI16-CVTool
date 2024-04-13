import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../features/authentication/screens/login/login.dart';
import '../../models/private_user_model.dart';

class PrivateHomeScreen extends StatelessWidget {
  const PrivateHomeScreen({super.key, required this.user});

  final PrivateUser user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  // Welcome and leave button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Username
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            user.job,
                            style: const TextStyle(color: Colors.white54),
                          ),
                        ],
                      ),

                      // Leave Icon
                      TextButton(
                        onPressed: () => Get.to(() => const LoginScreen()),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue[400],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(19),
                          child: const Icon(
                            Icons.exit_to_app,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 5),

            // Divider
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(25),
                color: Colors.grey[300],
                child: Column(
                  children: [
                    // Header for Experiences
                    _buildHeader('Experiencias'),
                    const SizedBox(height: 10),

                    // List of Experiences


                    // Header for Competences
                    _buildHeader('Competências'),
                    const SizedBox(height: 5),

                    // Another List

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Extra Widgets
Widget _buildHeader(String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      TextButton(
        onPressed: () {},
        child: Container(
          padding: const EdgeInsets.all(5),
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
    ],
  );
}