import 'dart:convert';
import 'package:tfc_versaofinal/models/business_user.dart';
import 'package:tfc_versaofinal/models/proposta.dart';
import 'package:tfc_versaofinal/utils/http/http_client.dart';

class OffersRepository {
  final HttpClient _client;

  // Client.
  OffersRepository({required HttpClient client}) : _client = client;

  // Encode.
  String basicAuth = 'Basic ${base64Encode(utf8.encode('admin:123'))}';

  // List that gets all the offers.
  Future<List<Proposta>> getOffersList() async {
    // Call API to get normal Users.
    final response = await _client.get(
      url: 'http://10.0.2.2:8080/api/propostas/list',
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );

    if (response.statusCode == 200) {
      final responseJSON = jsonDecode(response.body);

      print('Response JSON: $responseJSON'); // Debugging line

      if (responseJSON is List) {
        List<Proposta> propostas =
        responseJSON.map((offer) => Proposta.fromMap(offer)).toList();
        return propostas;
      } else {
        throw Exception('Invalid response format');
      }
    } else {
      throw Exception('Status code: ${response.statusCode}');
    }
  }

  // Get the offer by id
  Future<Proposta?> getOfferById(int id) async {
    return null;
  }

  // Create a offer by id
  Future<String> createOffer(String area, String description, String skills, BusinessUser author) async {
    return "";
  }

  // Update the offer by id
  Future<String> updateTheOffer(int id, String area, String description, String skills) async {
    return "";
  }

  // Delete offer by id
  Future<String> deleteOfferById(int id) async {
    return "";
  }
}