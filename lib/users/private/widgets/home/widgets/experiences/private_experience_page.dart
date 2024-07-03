import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfc_versaofinal/models/normal_user.dart';
import 'package:tfc_versaofinal/repository/experiencia_repository.dart';
import 'package:tfc_versaofinal/repository/normal_user_repository.dart';

class NewExperienceScreen extends StatefulWidget {
  const NewExperienceScreen({Key? key, required this.user, required this.onExperienceAdded})
      : super(key: key);

  final NormalUser user;
  final VoidCallback onExperienceAdded;

  @override
  _NewExperienceScreenState createState() => _NewExperienceScreenState();
}

class _NewExperienceScreenState extends State<NewExperienceScreen> {
  late NormalUserRepository normalUserRepository;
  late ExperienciaRepository experienceRepository;
  final _formKey = GlobalKey<FormState>();

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
        final NormalUser? user = await normalUserRepository.getUserById(widget.user.id);

        if (user == null) {
          throw Exception('User not found');
        }

        final message = await experienceRepository.createExperience(
          id: 0,
          city: _cityController.text,
          job: _jobController.text,
          nomeEmpresa: _companyNameController.text,
          duration: _durationController.text,
          author: user,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );

        // Trigger the callback to notify the parent screen to refresh data
        widget.onExperienceAdded();

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
        title: const Text('Adicionar uma nova Experiência'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _cityController,
                decoration: const InputDecoration(labelText: 'Cidade'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira uma cidade';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _jobController,
                decoration: const InputDecoration(labelText: 'Profissão'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira uma profissão';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _companyNameController,
                decoration: const InputDecoration(labelText: 'Empresa'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Introduza o nome da empresa';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _durationController,
                decoration: const InputDecoration(labelText: 'Duração ex.: 2 Meses'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Introduza a duração';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Criar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
