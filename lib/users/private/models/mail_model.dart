// Here we have the mail data model

class MailModel {
  String? author;
  String? job;
  String? company;
  bool accepted;
  DateTime creationDate; // Changed to DateTime type
  double? salary;
  String? local;

  MailModel({
    this.author,
    this.job,
    this.company,
    required this.accepted,
    required this.creationDate,
    this.salary,
    this.local,
  });

  static List<MailModel> main_mail_list = [
    MailModel(
        job: "Professor de Artes",
        author: "Salustio",
        accepted: true,
        creationDate: DateTime.now(),
        salary: 1300,
        company: "Lusofona",
        local: "Lisboa"),
  ];
}
