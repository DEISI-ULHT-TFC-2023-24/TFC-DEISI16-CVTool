// Private Experiences class model

class PrivateExperiences {
  String name;
  String company;
  String description;
  DateTime date;

  PrivateExperiences({
    required this.name,
    required this.company,
    required this.description,
    required this.date,
  });

  static List<PrivateExperiences> main_Experiences = [
    PrivateExperiences(name: "Diretor de Segurança Informática", company: "IBM - USA", description: "Estamos à procura de seniors.", date: DateTime(2024,07,01)),
    PrivateExperiences(name: "Diretor de Recursos Humanos", company: "Tesla", description: "Estamos à procura de seniors.", date: DateTime(2024,07,01)),
  ];
}
