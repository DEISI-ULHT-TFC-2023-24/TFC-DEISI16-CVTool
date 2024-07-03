import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfc_versaofinal/models/normal_user.dart';
import 'package:tfc_versaofinal/repository/experiencia_repository.dart';
import 'package:tfc_versaofinal/repository/normal_user_repository.dart';

class NewExperienceScreen extends StatefulWidget {
  const NewExperienceScreen({super.key, required this.user});

  final NormalUser user;

  @override
  _NewExperienceScreenState createState() => _NewExperienceScreenState();
}

class _NewExperienceScreenState extends State<NewExperienceScreen> {
  late NormalUserRepository normalUserRepository;
  final _formKey = GlobalKey<FormState>();
  late ExperienciaRepository experienceRepository;

  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    experienceRepository = context.read<ExperienciaRepository>();
    normalUserRepository = context.read<NormalUserRepository>();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Await the result of getUserById
        final NormalUser? user = await normalUserRepository.getUserById(widget.user.id);

        if (user == null) {
          throw Exception('User not found');
        }

        final message = await experienceRepository.createExperience(
          id: 0,
          city: _cityController.text.toString(),
          job: _jobController.text.toString(),
          nomeEmpresa: _companyNameController.text.toString(),
          duration: _durationController.text.toString(),
          author: user,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
        Navigator.of(context).pop(); // Go back to the previous screen
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create experience: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Experience'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _cityController,
                decoration: const InputDecoration(labelText: 'City'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a city';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _jobController,
                decoration: const InputDecoration(labelText: 'Job'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a job title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _companyNameController,
                decoration: const InputDecoration(labelText: 'CompanyName'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a company name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _durationController,
                decoration: const InputDecoration(labelText: 'Duration'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the duration';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Create Experience'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
