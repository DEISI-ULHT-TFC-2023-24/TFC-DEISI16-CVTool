import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tfc_versaofinal/users/private/models/mail_model.dart';

class PrivateMailScreen extends StatefulWidget {
  const PrivateMailScreen({Key? key}) : super(key: key);

  @override
  State<PrivateMailScreen> createState() => _OffersPageState();
}

class _OffersPageState extends State<PrivateMailScreen> {
  // Dummy List

  static List<MailModel> display_mail_list =
      List.from(MailModel.main_mail_list);

  void updateList(String value) {
    // This function will do the filter in our list.
    setState(() {
      display_mail_list = MailModel.main_mail_list
          .where((element) =>
              element.job!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  void removeItem(int index) {
    setState(() {
      display_mail_list.removeAt(index);
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Page name
            const Text(
              'Correio',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // ListView
            Expanded(
              child: display_mail_list.isEmpty
                  ? const Center(
                      child: Text(
                        "Sem mensagens novas",
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
                        itemCount: display_mail_list.length,
                        itemBuilder: (context, index) => ListTile(
                          contentPadding: const EdgeInsets.all(8.0),
                          title: Text(
                            display_mail_list[index].job!,
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
                                display_mail_list[index].author!,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                display_mail_list[index].company!,
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
                                  display_mail_list[index].local!,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ]),
                            ],
                          ),
                          trailing: display_mail_list[index].accepted == true
                              ? const Text(
                            'Aceite',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )
                              : const Text(
                            'Rejeitada',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          leading: TextButton(
                            onPressed: () {
                              removeItem(index);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Apagado'),
                                ),
                              );
                            },
                            child: const Icon(Icons.delete),
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
