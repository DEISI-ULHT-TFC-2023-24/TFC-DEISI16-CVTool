import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfc_versaofinal/repository/business_user_repository.dart';
import 'package:tfc_versaofinal/repository/normal_user_repository.dart';
import 'package:tfc_versaofinal/test/test_detail_page.dart';
import '../models/business_user.dart';
import '../models/normal_user.dart';

class NormalUserInfoTest extends StatefulWidget {
  NormalUserInfoTest({super.key});

  @override
  State<NormalUserInfoTest> createState() => _NormalUserInfoTestState();
}

class _NormalUserInfoTestState extends State<NormalUserInfoTest> {
  List<BusinessUser> businessUsers = [];

  @override
  Widget build(BuildContext context) {
    //Variables
    final repository = context.read<BusinessUserRepository>();

    return Scaffold(
      appBar: AppBar(title: const Text('Normal User Test'),),
      body: businessUsers.isEmpty ? buildNormalUserButton(repository) : buildList(),
    );
  }

  // Build the list.
  Widget buildList() {
    return ListView.separated(
      itemBuilder: (_, index) => ListTile(
          leading: const Icon(Icons.man),
          title: Text(businessUsers[index].name),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      UserDetailsPage(userId: businessUsers[index].id)))),
      separatorBuilder: (_, index) =>
          const Divider(color: Colors.grey, thickness: 0.5),
      itemCount: businessUsers.length,
    );
  }

  // Build the button.
  Center buildNormalUserButton(BusinessUserRepository repository) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          businessUsers = await repository.getBusinessUsers();
          setState(() { });
        },
        child: const Text('Get Users'),
      ),
    );
  }
}
