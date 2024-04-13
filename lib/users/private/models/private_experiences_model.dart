// Private Experiences class model
import 'package:flutter/material.dart';

class PrivateExperiences {
  String name;
  Icon icon = const Icon(Icons.shield);
  String company;
  String description;
  DateTime date;

  PrivateExperiences({
    required this.name,
    required this.company,
    required this.description,
    required this.date,
  });
}
