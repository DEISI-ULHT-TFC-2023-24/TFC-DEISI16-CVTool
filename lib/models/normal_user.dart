class NormalUser {
  final String id;
  final String email;
  final String name;
  final String username;
  final String gender;
  final String job;
  final String phoneNumber;
  final String age;
  final String password;
  final String? academy;
  final String? skills;
  final String? experience;

  NormalUser({
    required this.id,
    required this.email,
    required this.name,
    required this.username,
    required this.job,
    required this.gender,
    required this.phoneNumber,
    required this.age,
    required this.password,
    this.academy,
    this.skills,
    this.experience});

  factory NormalUser.fromMap(Map<String, dynamic> map) {
    return NormalUser(
        id: map['id'].toString(),  // Ensuring id is a String
        email: map['email'] ?? '',
        name: map['name'] ?? '',
        username: map['username'] ?? '',
        gender: map['gender'] ?? '',
        job: map['profissao'] ?? '',
        phoneNumber: map['numeroDeTelemovel'] ?? '',
        age: map['age'].toString(),  // Ensuring age is a String
        password: map['password'] ?? ''
    );
  }
}
