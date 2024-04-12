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
        author: "Jon Smith",
        job: "Engenheiro Informático",
        company: "LusoTrip.lda",
        local: "Lisboa",
        details: "Estamos à procura de alguém com grande capacidades.",
        nrOffers: '10',
        salary: 1350.0,
        creationDate: DateTime.now()),
    OfferModel(
        author: "David Guetta",
        job: "Técnico Informático",
        company: "MusicWorld.lda",
        local: "Porto",
        details:
        "Estamos à procura de alguém com grande capacidades e conhecimentos de música.",
        nrOffers: '4',
        salary: 2300.0,
        creationDate: DateTime.now()),
    OfferModel(
        author: "Marta Jobson",
        job: "Engenheiro Espacial",
        company: "Nasa.lda",
        local: "Aveiro",
        details:
        "Estamos à procura de alguém com grande capacidades e conhecimentos de música.",
        nrOffers: '6',
        salary: 2605.0,
        creationDate: DateTime.now()),
    OfferModel(
        author: "Henrique Fonseca",
        job: "Diretor Executivo de Marketing",
        company: "PingoDoce.lda",
        local: "Lisboa",
        details:
        "Estamos à procura de alguém com grande capacidades e conhecimentos de música.",
        nrOffers: '15',
        salary: 3900.0,
        creationDate: DateTime.now()),
    OfferModel(
        author: "Henrique Fonseca",
        job: "Diretor Executivo de Negocios",
        company: "sss.lda",
        local: "Lisboa",
        details:
        "Estamos à procura de alguém com grande capacidades e conhecimentos de música.",
        nrOffers: '10',
        salary: 3900.0,
        creationDate: DateTime.now()),
    OfferModel(
        author: "Marcus Fonseca",
        job: "Piloto de Fórmula 1",
        company: "RedBull.lda",
        local: "Lisboa",
        details:
        "Estamos à procura de alguém com grande capacidades e conhecimentos de música.",
        nrOffers: '1',
        salary: 10000.0,
        creationDate: DateTime.now()),
    OfferModel(
        author: "Marta Peixe Fonseca",
        company: "Alaba.lda",
        job: "Professor de Artes",
        local: "Lisboa",
        details:
        "Estamos à procura de alguém com grande capacidades e conhecimentos de música.",
        nrOffers: '15',
        salary: 8000.0,
        creationDate: DateTime.now()),
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