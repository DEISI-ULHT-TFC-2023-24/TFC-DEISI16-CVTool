// Business Experiences class model

class BusinessExperiences {
  String name;
  String company;
  String description;
  DateTime date;

  BusinessExperiences({
    required this.name,
    required this.company,
    required this.description,
    required this.date,
  });

  static List<BusinessExperiences> main_skill_test = [
    BusinessExperiences(name: "Diretor de Segurança Informática", company: "IBM - USA", description: "Estamos à procura de seniors.", date: DateTime(2024,07,01)),
    BusinessExperiences(name: "Diretor de Recursos Humanos", company: "Tesla", description: "Estamos à procura de seniors.", date: DateTime(2024,07,01)),
  ];
}
