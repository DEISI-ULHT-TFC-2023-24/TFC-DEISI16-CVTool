import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../private/models/offer_model.dart';
import '../../models/business_user_model.dart';

class BusinessOffersScreen extends StatefulWidget {
  const BusinessOffersScreen({super.key, required this.user});

  final BusinessUser user;

  @override
  State<BusinessOffersScreen> createState() => _OffersPageState();
}

class _OffersPageState extends State<BusinessOffersScreen> {
  // Dummy List

  late BusinessUser user;

  late List<OfferModel> offers = user.offers;

  void updateList(String value) {
    // This function will do the filter in our list.
    setState(() {
      offers = user.offers
          .where((element) =>
              element.job!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    user = widget.user;
    offers = user.offers;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Ofertas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            // Page name

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
              child: offers.isEmpty
                  ? const Center(
                      child: Text(
                        "Sem resultados",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[300],
                      ),
                      padding: const EdgeInsets.all(15),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: offers.length,
                        itemBuilder: (context, index) => ListTile(
                          contentPadding: const EdgeInsets.all(8.0),
                          title: Text(
                            offers[index].job!,
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
                                offers[index].company!,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                offers[index].local!,
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
                                  offers[index].nrOffers!,
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
            ),
          ],
        ),
      ),
    );
  }
}
