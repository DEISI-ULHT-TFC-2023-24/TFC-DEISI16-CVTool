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

  static List<OfferModel> display_list = List.from(OfferModel.main_offers_list);

  void updateList(String value) {
    // This function will do the filter in our list.
    setState(() {
      display_list = OfferModel.main_offers_list
          .where((element) =>
              element.job!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
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

            // Search Bar
            TextField(
              onChanged: (value) => updateList(value),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "Ex.: Engenheiro Informático",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.black,
              ),
            ),
            const SizedBox(height: 10.0),

            // ListView
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[300],
                ),
                padding: const EdgeInsets.all(15),
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
                        fontSize: 16,
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
                    trailing: TextButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.arrow_forward_ios,
                      ),
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
