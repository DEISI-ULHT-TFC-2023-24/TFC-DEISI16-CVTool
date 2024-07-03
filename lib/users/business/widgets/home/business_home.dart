import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../features/authentication/screens/login/login.dart';
import '../../../../models/business_user.dart';
import '../../../../repository/propostas_repository.dart';


class BusinessHomeScreen extends StatefulWidget {
  BusinessHomeScreen({Key? key, required this.user}) : super(key: key);

  final BusinessUser user;

  @override
  _BusinessHomeScreenState createState() => _BusinessHomeScreenState();
}

class _BusinessHomeScreenState extends State<BusinessHomeScreen> {
  late OffersRepository offersRepository;

  List<OffersRepository> offers = [];

  @override
  void initState() {
    super.initState();
    offersRepository = context.read<OffersRepository>();
  }

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
                            widget.user.name,
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
                            widget.user.job,
                            style: const TextStyle(color: Colors.white54),
                          ),
                        ],
                      ),

                      // Leave Icon
                      TextButton(
                        onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginScreen())),
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Candidaturas recebidas',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // List of Experiences
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[300],
                        ),
                        padding: const EdgeInsets.all(15),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 0,
                          itemBuilder: (context, index) => ListTile(
                            contentPadding: const EdgeInsets.all(8.0),
                            title: const Text(
                              " ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  " ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                            ),
                            leading: const Icon(
                              Icons.workspace_premium,
                              color: Colors.black,
                            ),
                            onTap: () {
                              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => BusinessExperiencePage(experience: experiences, user: widget.user)));
                            },
                          ),
                        ),
                      ),
                    ),
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

/*
class NewExperienceScreen extends StatefulWidget {
  final Function(ExperienciaLaboral) addExperience;

  const NewExperienceScreen(this.addExperience);

  @override
  _NewExperienceScreenState createState() => _NewExperienceScreenState();
}

class _NewExperienceScreenState extends State<NewExperienceScreen> {
  late String _name;
  late String _company;

  @override
  void initState() {
    super.initState();
    _name = '';
    _company = '';
  }

  void _submitExperience() {
   // widget.addExperience(e(name: _name, company: _company, description: '', date: DateTime.now()));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Experience'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) => setState(() => _name = value),
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 16),
            TextField(
              onChanged: (value) => setState(() => _company = value),
              decoration: const InputDecoration(labelText: 'Company'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitExperience,
              child: const Text('Add Experience'),
            ),
          ],
        ),
      ),
    );
  }
}

 */
