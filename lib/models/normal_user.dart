// This is the Normal User Data Model
class NormalUser {
  final String id;
  final String email;
  final String name;
  final String username;
  final String job;
  final String phoneNumber;
  final String age;
  final String password;
  final String? academy;
  final String? skills;
  final String? experience;

  NormalUser({required this.id,
    required this.email,
    required this.name,
    required this.username,
    required this.job,
    required this.phoneNumber,
    required this.age,
    required this.password,
    this.academy,
    this.skills,
    this.experience});

  factory NormalUser.fromMap(Map<String, dynamic> map) {
    return NormalUser(id: map['id'],
        email: map ['email'],
        name: map['name'],
        username: map['username'],
        job: map['profissao'],
        phoneNumber: map['numeroDeTelemovel'],
        age: map['age'],
        password: map['password'],
        academy: map['academicSkills'],
        skills: map['skills'],
        experience: map['experience']
    );
  }

}


