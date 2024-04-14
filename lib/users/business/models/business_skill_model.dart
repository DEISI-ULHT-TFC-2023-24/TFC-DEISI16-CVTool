// Business User skills
import 'package:flutter/material.dart';

class BusinessSkill {
  String name;
  Icon icon = const Icon(Icons.shield);
  String school;
  String description;
  DateTime date;

  BusinessSkill({
    required this.name,
    required this.school,
    required this.description,
    required this.date,
  });

  static List<BusinessSkill> main_skill_test = [
    BusinessSkill(name: "Licenciatura em Engenharia Informática", school: "Universidade Lusófona", description: "Tirei a licenciatura em Engenharia Informática na Universidade Lusófona.", date: DateTime(2024,07,01)),
    BusinessSkill(name: "Mestrado em Engenharia Informática", school: "Técnico de Lisboa", description: "Tirei o Mestrado em Engenharia Informática no Tecnico de Lisboa.", date: DateTime(2026,07,01)),
  ];
}