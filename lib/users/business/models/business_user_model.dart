// This is the Business User Data Model
class BusinessUser {
  String name;
  String email;
  String username;
  String password;
  String phoneNumber;
  String job;
  String? company;

  BusinessUser({
    required this.name,
    required this.email,
    required this.username,
    required this.password,
    required this.phoneNumber,
    required this.job,
    this.company,
  });

  static List<BusinessUser> main_business_users = [
    BusinessUser(name: "Rui Ribeiro", email: "RuiRibeiro@gmail.com", username: "Rui", password: "Rui123!", phoneNumber: "962821351", job: "Expert em Marketing", company: "Lusofona"),
    BusinessUser(name: "Recrutador Teste", email: "RecrutadorTeste@teste.com", username: "Test", password: "test2024*", phoneNumber: "962821351", job: "Engenheiro de testes"),
  ];

}