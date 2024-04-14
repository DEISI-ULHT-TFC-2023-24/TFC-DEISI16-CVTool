import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../../../models/private_experiences_model.dart';
import '../../../models/private_user_model.dart';


class PrivateExperiencePage extends StatelessWidget {
  final List<PrivateExperiences> experience;
  final PrivateUser user;

  const PrivateExperiencePage({Key? key, required this.experience, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Experiências do utilizador'), // Example title, replace it with your desired text
      ),
      body: ListView.builder(
        itemCount: experience.length,
        itemBuilder: (context, index) {
          final item = experience[index];
          return ListTile(
            title: Text(
              item.name,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            subtitle: Text(
              item.description,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                user.experiences?.remove(experience[index]);
                Get.back();
              },
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            // Add any other properties you want to display
          );
        },
      ),
    );
  }
}
