import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfc_versaofinal/repository/normal_user_repository.dart';


class UserDetailsPage extends StatefulWidget {
  final String userId;

  const UserDetailsPage({super.key, required this.userId});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final repository = context.read<NormalUserRepository>();

    return Scaffold(
      appBar: AppBar(title: Text('${widget.userId}')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ok',
            style: TextStyle(fontSize: 40)),
          ],
        ),
      ),
    );
  }
}
