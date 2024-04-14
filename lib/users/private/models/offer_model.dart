// Here we have the Offer data model

class OfferModel {
  String? author;
  String? job;
  String? company;
  String? details;
  DateTime creationDate; // Changed to DateTime type
  double? salary;
  String? local;
  String? nrOffers;

  OfferModel({
    this.author,
    this.job,
    this.company,
    this.details,
    required this.creationDate,
    this.salary,
    this.local,
    this.nrOffers,
  });

  static List<OfferModel> main_offers_list = [
    OfferModel(
        author: "Henrique Monte Seco",
        job: "Diretor de Marketing",
        company: "Aldi.lda",
        local: "Lisboa",
        details:
        "Estamos à procura de alguém com grande capacidades e conhecimentos de música.",
        nrOffers: '15',
        salary: 2100.0,
        creationDate: DateTime.now()),
  ];
}