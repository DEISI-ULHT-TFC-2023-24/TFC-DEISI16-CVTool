import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfc_versaofinal/models/normal_user.dart';
import '../../../../models/proposta.dart';
import '../../../../repository/propostas_repository.dart';
import 'private_offer_page.dart';

class PrivateOffersScreen extends StatefulWidget {
  final NormalUser user;

  const PrivateOffersScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<PrivateOffersScreen> createState() => _OffersPageState();
}

class _OffersPageState extends State<PrivateOffersScreen> {
  late OffersRepository offersRepository;

  List<Proposta> offers = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    offersRepository = context.read<OffersRepository>();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final fetchedOffers = await offersRepository.getOffersList();
      setState(() {
        offers = fetchedOffers ?? [];
        isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
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
            const Text(
              'Ofertas',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : offers.isEmpty
                      ? const Center(
                          child: Text(
                            "Sem resultados",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: offers.length,
                          itemBuilder: (context, index) {
                            final offer = offers[index];
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 8.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                                // Adjust the radius as needed
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: ListTile(
                                selectedColor: Colors.cyan,
                                contentPadding: const EdgeInsets.all(8.0),
                                title: Text(
                                  offer.area,
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
                                      offer.author.company,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      offer.descricao,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => PrivateOfferPage(
                                          user: widget.user,
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                  ),
                                ),
                                leading: const Icon(
                                  Icons.work,
                                  color: Colors.black,
                                ),
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
