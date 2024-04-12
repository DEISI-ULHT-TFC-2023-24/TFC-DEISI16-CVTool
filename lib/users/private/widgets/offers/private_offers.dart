import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../models/offer_model.dart';

class PrivateOffersScreen extends StatefulWidget {
  const PrivateOffersScreen({Key? key}) : super(key: key);

  @override
  State<PrivateOffersScreen> createState() => _OffersPageState();
}

class _OffersPageState extends State<PrivateOffersScreen> {
  // Dummy List
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

  static List<OfferModel> display_list = List.from(main_offers_list);

  void updateList(String value) {
    // This function will do the filter in our list.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[600],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Page name
            const Text(
              'Ofertas',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "Ex.: Engenheiro Informático",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.black,
              ),
            ),
            const SizedBox(height: 10.0),

            // ListView
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                color: Colors.grey[300],
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: display_list.length,
                  itemBuilder: (context, index) => ListTile(
                    contentPadding: const EdgeInsets.all(8.0),
                    title: Text(
                      display_list[index].job!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          display_list[index].company!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          display_list[index].local!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Row(children: [
                          const Text(
                            'Vagas: ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            display_list[index].nrOffers!,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ]),
                      ],
                    ),
                    leading: const Icon(
                      Icons.work,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
