// Private User skills
import 'package:flutter/material.dart';

class PrivateSkill {
  String name;
  Icon icon = const Icon(Icons.shield);
  String school;
  String description;
  DateTime date;

  PrivateSkill({
    required this.name,
    required this.school,
    required this.description,
    required this.date,
  });
}