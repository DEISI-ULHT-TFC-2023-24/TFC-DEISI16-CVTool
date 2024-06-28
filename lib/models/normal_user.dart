class NormalUser {
  final int id;
  final String email;
  final String name;
  final String username;
  final String gender;
  final String job;
  final String phoneNumber;
  final int age;
  final String password;

  NormalUser({
    required this.id,
    required this.email,
    required this.name,
    required this.username,
    required this.gender,
    required this.job,
    required this.phoneNumber,
    required this.age,
    required this.password,
  });

  factory NormalUser.fromMap(Map<String, dynamic> map) {
    return NormalUser(
      id: map['id'],
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      username: map['username'] ?? '',
      gender: map['gender'] ?? '',
      job: map['profissao'] ?? '',
      phoneNumber: map['numeroDeTelemovel'] ?? '',
      age: map['age'] ?? 0,
      password: map['password'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'username': username,
      'gender': gender,
      'profissao': job,
      'numeroDeTelemovel': phoneNumber,
      'age': age,
      'password': password,
    };
  }
}
