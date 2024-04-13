// This is the Private User Data Model
import 'package:tfc_versaofinal/users/private/models/private_experiences_model.dart';
import 'package:tfc_versaofinal/users/private/models/private_skills_model.dart';

class PrivateUser {
  String name;
  String email;
  String username;
  String password;
  String phoneNumber;
  String job;
  List<PrivateExperiences>? experiences = [];
  List<PrivateSkill>? skills = [];

  PrivateUser({
    required this.name,
    required this.email,
    required this.username,
    required this.password,
    required this.phoneNumber,
    required this.job,
  });

  static List<PrivateUser> main_private_users = [
    PrivateUser(name: "Dionísio Miron", email: "admin@gmail.com", username: "admin", password: "Admin123!", phoneNumber: "962821351", job: "Engenheiro Informático"),
    PrivateUser(name: "Testador App", email: "teste@teste.com", username: "Test", password: "test2024*", phoneNumber: "962821351", job: "Engenheiro de testes"),
  ];

}