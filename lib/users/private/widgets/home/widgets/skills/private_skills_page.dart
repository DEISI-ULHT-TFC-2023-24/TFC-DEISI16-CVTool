import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfc_versaofinal/models/normal_user.dart';
import 'package:tfc_versaofinal/repository/normal_user_repository.dart';
import 'package:tfc_versaofinal/repository/skills_repository.dart';


class NewSkillScreen extends StatefulWidget {
  const NewSkillScreen({
    Key? key,
    required this.user,
    required this.onSkillAdded,
  }) : super(key: key);

  final NormalUser user;
  final VoidCallback onSkillAdded;

  @override
  _NewSkillScreenState createState() => _NewSkillScreenState();
}

class _NewSkillScreenState extends State<NewSkillScreen> {
  late NormalUserRepository normalUserRepository;
  late SkillsRepository skillsRepository;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  String? _typeController; // Changed to nullable

  @override
  void initState() {
    super.initState();
    skillsRepository = context.read<SkillsRepository>();
    normalUserRepository = context.read<NormalUserRepository>();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        final NormalUser? user =
        await normalUserRepository.getUserById(widget.user.id);

        if (user == null) {
          throw Exception('User not found');
        }

        final message = await skillsRepository.createSkill(
          name: _nameController.text,
          typeOfSkill: _typeController ?? '', // Ensure type is not null
          author: user,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );

        // Trigger the callback to notify the parent screen to refresh data
        widget.onSkillAdded();

        Navigator.of(context).pop(); // Go back to the previous screen
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create skill: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar uma nova competência'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor introduza o nome da competência';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _typeController,
                decoration: const InputDecoration(
                  labelText: 'Tipo',
                  prefixIcon: Icon(Icons.work),
                ),
                items: ['Soft Skill', 'Técnica', 'Outro']
                    .map((type) => DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _typeController = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor selecione o tipo da competência';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Criar Competência'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
