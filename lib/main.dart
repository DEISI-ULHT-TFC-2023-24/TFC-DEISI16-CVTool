import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfc_versaofinal/repository/normal_user_repository.dart';
import 'package:tfc_versaofinal/utils/http/http_client.dart';
import 'app.dart';


void main() {

  runApp(Provider(
      create: (_) => NormalUserRepository(client: HttpClient()),
      child: const App(),
  ));

  //runApp(const App());
}
