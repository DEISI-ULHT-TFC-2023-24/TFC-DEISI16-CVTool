import 'package:flutter/material.dart';

import '../../../../models/private_experiences_model.dart';

class NewPrivateExperienceScreen extends StatefulWidget {
  final Function(PrivateExperiences) addExperience;

  const NewPrivateExperienceScreen(this.addExperience, {super.key});

  @override
  _NewExperienceScreenState createState() => _NewExperienceScreenState();
}

class _NewExperienceScreenState extends State<NewPrivateExperienceScreen> {
  late String _name;
  late String _company;
  late String _description;

  @override
  void initState() {
    super.initState();
    _name = '';
    _company = '';
    _description = '';
  }

  void _submitExperience() {
    widget.addExperience(PrivateExperiences(name: _name, company: _company, description: _description, date: DateTime.now()));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar nova Experiência'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) => setState(() => _name = value),
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            const SizedBox(height: 16),
            TextField(
              onChanged: (value) => setState(() => _company = value),
              decoration: const InputDecoration(labelText: 'Empresa'),
            ),
            const SizedBox(height: 16),
            TextField(
              onChanged: (value) => setState(() => _description = value),
              decoration: const InputDecoration(labelText: 'Descrição'),
            ),
            ElevatedButton(
              onPressed: _submitExperience,
              child: const Text('Adicionar'),
            ),
          ],
        ),
      ),
    );
  }
}