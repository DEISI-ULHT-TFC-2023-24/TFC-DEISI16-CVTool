import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfc_versaofinal/features/authentication/screens/login/login.dart';
import 'package:tfc_versaofinal/users/private/models/private_user_model.dart';

import '../../models/private_experiences_model.dart';
import '../../models/private_skills_model.dart';

class PrivateHomeScreen extends StatelessWidget {
  const PrivateHomeScreen({Key? key, required this.user}) : super(key: key);

  final PrivateUser user;

  @override
  Widget build(BuildContext context) {
    final List<PrivateSkill> skills = user.skills ?? [];
    final List<PrivateExperiences> experiences = user.experiences ?? [];

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
                        onPressed: () {
                          // Implement logout functionality
                          Get.to(() => const LoginScreen());
                        },
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

            const Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Text('Experiências',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Divider
            Expanded(
              child: experiences.isEmpty
                  ? const Center(
                      child: Text(
                        "Sem resultados",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[300],
                      ),
                      padding: const EdgeInsets.all(15),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: experiences.length,
                        itemBuilder: (context, index) => ListTile(
                          contentPadding: const EdgeInsets.all(8.0),
                          title: Text(
                            experiences[index].name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(
                            experiences[index].company,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          leading: const Icon(
                            Icons.work,
                            color: Colors.black,
                          ),
                        ),
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
