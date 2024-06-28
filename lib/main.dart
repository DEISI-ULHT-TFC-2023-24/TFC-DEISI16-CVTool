import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfc_versaofinal/repository/business_user_repository.dart';
import 'package:tfc_versaofinal/repository/comments_repository.dart';
import 'package:tfc_versaofinal/repository/experiencia_repository.dart';
import 'package:tfc_versaofinal/repository/formacao_repository.dart';
import 'package:tfc_versaofinal/repository/normal_user_repository.dart';
import 'package:tfc_versaofinal/repository/propostas_repository.dart';
import 'package:tfc_versaofinal/repository/skills_repository.dart';
import 'package:tfc_versaofinal/utils/http/http_client.dart';
import 'app.dart';


void main() {
  var client = HttpClient();

  runApp(
    MultiProvider(
      providers: [
        Provider<NormalUserRepository>(create: (context) => NormalUserRepository(client: client)),
        Provider<BusinessUserRepository>(create: (context) => BusinessUserRepository(client: client)),
        Provider<SkillsRepository>(create: (context) => SkillsRepository(client: client)),
        Provider<OffersRepository>(create: (context) => OffersRepository(client: client)),
        Provider<FormacaoRepository>(create: (context) => FormacaoRepository(client: client)),
        Provider<ExperienciaRepository>(create: (context) => ExperienciaRepository(client: client)),
        Provider<CommentsRepository>(create: (context) => CommentsRepository(client: client)),
      ],
      child: const App(),
    ),
  );
}
