import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfc_versaofinal/models/experiencia_laboral.dart';
import 'package:tfc_versaofinal/models/competencias.dart';
import 'package:tfc_versaofinal/repository/experiencia_repository.dart';
import 'package:tfc_versaofinal/repository/skills_repository.dart';
import 'package:tfc_versaofinal/features/authentication/screens/login/login.dart';
import 'package:tfc_versaofinal/users/private/widgets/home/widgets/experiences/private_experience_page.dart';
import 'package:tfc_versaofinal/users/private/widgets/home/widgets/skills/private_skills_page.dart';
import '../../../../models/normal_user.dart';

class PrivateHomeScreen extends StatefulWidget {
  const PrivateHomeScreen({super.key, required this.user});

  final NormalUser user;

  @override
  _PrivateHomeScreenState createState() => _PrivateHomeScreenState();
}

class _PrivateHomeScreenState extends State<PrivateHomeScreen> {
  late ExperienciaRepository experienceRepository;
  late SkillsRepository skillsRepository;

  List<ExperienciaLaboral> experiences = [];
  List<Competencias> skills = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    experienceRepository = context.read<ExperienciaRepository>();
    skillsRepository = context.read<SkillsRepository>();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final fetchedExperiences = await experienceRepository
          .getExperienceByAuthor(widget.user.username);
      final fetchedSkills = await skillsRepository
          .getSkillsByAuthorUsername(widget.user.username);
      setState(() {
        experiences = fetchedExperiences ?? [];
        skills = fetchedSkills ?? [];
        isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  void _onExperienceAdded() {
    _fetchData();
  }

  void _onSkillAdded() {
    _fetchData();
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                          const SizedBox(height: 6),
                          Text(
                            widget.user.job,
                            style: const TextStyle(color: Colors.white54),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        ),
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
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(25),
                color: Colors.grey[300],
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Experiencias',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => NewExperienceScreen(
                                        user: widget.user,
                                        onExperienceAdded: _onExperienceAdded,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: ListView.builder(
                              itemCount: experiences.length,
                              itemBuilder: (context, index) {
                                final experience = experiences[index];
                                return ListTile(
                                  contentPadding: const EdgeInsets.all(8.0),
                                  title: Text(
                                    experience.job,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        experience.companyName,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${experience.city} - ",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Text(
                                            experience.durationOfExperience,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  leading: const Icon(
                                    Icons.work,
                                    color: Colors.black,
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text(
                                                'Excluir Experiência'),
                                            content: const Text(
                                                'Tem a certeza que quer apagar a experiência?'),
                                            actions: <Widget>[
                                              TextButton(
                                                child: Text('Cancelar'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              TextButton(
                                                child: Text('Apagar'),
                                                onPressed: () async {
                                                  experienceRepository
                                                      .deleteExperienceById(
                                                          experience.id);
                                                  setState(() {
                                                    experienceRepository =
                                                        context.read<
                                                            ExperienciaRepository>();
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  onTap: () {
                                    // Navigate to experience details
                                  },
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Competencias',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => NewSkillScreen(
                                        user: widget.user,
                                        onSkillAdded: _onSkillAdded,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: ListView.builder(
                              itemCount: skills.length,
                              itemBuilder: (context, index) {
                                final skill = skills[index];
                                return ListTile(
                                  contentPadding: const EdgeInsets.all(8.0),
                                  title: Text(
                                    skill.name,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        skill.type,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  leading: const Icon(
                                    Icons.workspace_premium,
                                    color: Colors.black,
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text(
                                                'Excluir Competencia'),
                                            content: const Text(
                                                'Tem a certeza que quer apagar a competencia?'),
                                            actions: <Widget>[
                                              TextButton(
                                                child: Text('Cancelar'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              TextButton(
                                                child: Text('Apagar'),
                                                onPressed: () async {
                                                  skillsRepository
                                                      .deleteSkillById(
                                                          skill.id);
                                                  setState(() {
                                                    skillsRepository =
                                                        context.read<
                                                            SkillsRepository>();
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
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
