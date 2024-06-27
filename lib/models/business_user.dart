// This is the Business User Data Model
class BusinessUser {
  final String id;
  final String email;
  final String name;
  final String username;
  final String job;
  final String phoneNumber;
  final String age;
  final String password;
  final String company;


  BusinessUser(
      {required this.id,
      required this.email,
      required this.name,
      required this.username,
      required this.job,
      required this.phoneNumber,
      required this.age,
      required this.password,
      required this.company,
      });

  factory BusinessUser.fromMap(Map<String, dynamic> map) {
    return BusinessUser(
        id: map['id'],
        email: map['email'],
        name: map['name'],
        username: map['username'],
        job: map['profissao'],
        phoneNumber: map['numeroDeTelemovel'],
        age: map['age'],
        password: map['password'],
        company: map['empresa']
    );
  }
}
