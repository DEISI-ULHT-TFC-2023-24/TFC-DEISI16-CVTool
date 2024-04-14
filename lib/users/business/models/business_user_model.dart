// This is the Business User Data Model
import 'package:tfc_versaofinal/users/business/models/business_experiences_model.dart';

import '../../private/models/offer_model.dart';

class BusinessUser {
  String name;
  String email;
  String username;
  String password;
  String phoneNumber;
  String job;
  String? company;
  List<OfferModel> offers = [];
  List<BusinessExperiences> experiences = BusinessExperiences.main_skill_test;

  BusinessUser({
    required this.name,
    required this.email,
    required this.username,
    required this.password,
    required this.phoneNumber,
    required this.job,
    this.company,
  });

  static List<BusinessUser> main_business_users = [
    BusinessUser(name: "Rui Ribeiro", email: "RuiRibeiro@gmail.com", username: "Rui", password: "Rui123!", phoneNumber: "962821351", job: "Expert em Marketing", company: "Lusofona"),
    BusinessUser(name: "Recrutador Teste", email: "RecrutadorTeste@teste.com", username: "Test", password: "test2024*", phoneNumber: "962821351", job: "Engenheiro de testes"),
  ];

  static BusinessUser? getBusinessUserByUsername(String username) {
    BusinessUser? user;
    try {
      user = main_business_users.firstWhere((user) => user.username == username);
    } catch (e) {
      user = null; // Set user to null if no user is found
    }
    return user;
  }

  void addOfferToBusinessUser(OfferModel offer) {
    offers.add(offer);
  }

  void addExperiences(BusinessExperiences experience) {
    experiences.add(experience);
  }
}