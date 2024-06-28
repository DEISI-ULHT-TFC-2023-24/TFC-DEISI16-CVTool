import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfc_versaofinal/models/normal_user.dart';
import 'package:tfc_versaofinal/repository/propostas_repository.dart';
import '../../../../models/proposta.dart';

class PrivateOfferPage extends StatefulWidget {
  final NormalUser user;

  const PrivateOfferPage({Key? key, required this.user}) : super(key: key);

  @override
  State<PrivateOfferPage> createState() => _PrivateOfferPageState();
}

class _PrivateOfferPageState extends State<PrivateOfferPage> {
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
      appBar: AppBar(
        title: const Text(
          'Oferta',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: offers.length,
        itemBuilder: (context, index) {
          final offer = offers[index];
          return Card( // Wrap with Card for a Material design look
            color: Colors.white, // Background color of the tile
            child: ListTile(
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
    );
  }
}
