import 'normal_user.dart';

class ExperienciaLaboral {
  final int id;
  final String city;
  final String job;
  final String companyName;
  final String durationOfExperience;
  final NormalUser? author;

  ExperienciaLaboral({
    required this.id,
    required this.city,
    required this.job,
    required this.companyName,
    required this.durationOfExperience,
    this.author,
  });

  factory ExperienciaLaboral.fromMap(Map<String, dynamic> map) {
    return ExperienciaLaboral(
      id: map['id'],
      city: map['cidade'] ?? '',
      job: map['profissao'] ?? '',
      companyName: map['nomeEmpresa'] ?? '', // Corrected key
      durationOfExperience: map['duracao'] ?? '', // Corrected key
      author: map['author'] != null ? NormalUser.fromMap(map['author']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cidade': city,
      'profissao': job,
      'nomeEmpresa': companyName, // Corrected key
      'duracao': durationOfExperience, // Corrected key
      'author': author?.toMap(), // Convert author to map if it's not null
    };
  }
}
