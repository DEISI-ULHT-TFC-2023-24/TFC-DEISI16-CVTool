import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfc_versaofinal/models/normal_user.dart';
import 'package:tfc_versaofinal/repository/formacao_repository.dart';
import 'package:tfc_versaofinal/repository/normal_user_repository.dart';

class NewFormationScreen extends StatefulWidget {
  const NewFormationScreen({
    Key? key,
    required this.user,
    required this.onFormationAdded,
  }) : super(key: key);

  final NormalUser user;
  final VoidCallback onFormationAdded;

  @override
  _NewFormationScreenState createState() => _NewFormationScreenState();
}

class _NewFormationScreenState extends State<NewFormationScreen> {
  late NormalUserRepository normalUserRepository;
  late FormacaoRepository formacaoRepository;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _instituteController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  String? _typeController;

  @override
  void initState() {
    super.initState();
    formacaoRepository = context.read<FormacaoRepository>();
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

        final message = await formacaoRepository.createFormacao(
          id: 0,
          name: _nameController.text,
          typeOfFormation: _typeController ?? '',
          institute: _instituteController.text,
          duration: _durationController.text,
          author: user,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );

        // Trigger the callback to notify the parent screen to refresh data
        widget.onFormationAdded();

        Navigator.of(context).pop(); // Go back to the previous screen
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create formation: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar uma nova formação'),
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
                    return 'Por favor introduza o nome da formação';
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
                items: ['Licenciatura', 'Mestrado', 'Doutoramento', 'Outros']
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
                    return 'Por favor selecione o tipo de formação';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _instituteController,
                decoration: const InputDecoration(labelText: 'Instituto'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor introduza o nome do instituto';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _durationController,
                decoration:
                const InputDecoration(labelText: 'Duração ex.: 1 ano'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor introduza a duração';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Criar Formação'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
