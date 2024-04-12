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
}