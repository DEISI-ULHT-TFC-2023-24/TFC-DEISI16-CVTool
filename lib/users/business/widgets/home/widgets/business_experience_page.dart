import 'package:flutter/material.dart';


class BusinessExperiencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  /*
  final List<Ex> experience;
  final BusinessUser user;

  const BusinessExperiencePage({Key? key, required this.experience, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Business Experiences'), // Example title, replace it with your desired text
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
                user.experiences.remove(experience[index]);
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

   */
}
