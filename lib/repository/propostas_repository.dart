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
    // API
    final response = await _client.get(
      url: 'http://10.0.2.2:8080/api/propostas/search/$id',
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );
    // Success Case
    if (response.statusCode == 200) {
      final responseJSON = jsonDecode(response.body);
      return Proposta.fromMap(responseJSON);
    } else if (response.statusCode == 404) {
      // Handle the case when the user is not found
      print('Offer not found');
      return null;
    } else {
      throw Exception(
          'Failed to load Offer, status code: ${response.statusCode}');
    }
  }

  // Create a offer by id
  Future<String> createOffer(int id, String area, String description, String skills, BusinessUser author) async {
    final Map<String, dynamic> user = {
      'id': id,
      'area': area,
      'descricao': description,
      'skills': skills,
      'author': author,
    };

    final response = await _client.post(
      url: 'http://10.0.2.2:8080/api/propostas/add',
      headers: {
        'Content-Type': 'application/json',
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
      body: jsonEncode(user),
    );

    if (response.statusCode == 201) {
      return 'Offer created successfully';
    } else if (response.statusCode == 409) {
      return 'Conflict: ${response.body}';
    } else {
      throw Exception(
          'Failed to create Offer, status code: ${response.statusCode}');
    }
  }

  // Update the offer by id
  Future<String> updateTheOffer(int id, String area, String description, String skills) async {
    final Map<String, dynamic> user = {
      'id': id,
      'area': area,
      'descricao': description,
      'skills': skills,
    };

    final response = await _client.put(
      url: 'http://10.0.2.2:8080/api/propostas/update',
      headers: {
        'Content-Type': 'application/json',
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
      body: jsonEncode(user),
    );

    if (response.statusCode == 200) {
      return 'Offer updated successfully';
    } else if (response.statusCode == 404) {
      return 'Not Found: ${response.body}';
    } else {
      throw Exception(
          'Failed to update Offer, status code: ${response.statusCode}');
    }
  }

  // Delete offer by id
  Future<String> deleteOfferById(int id) async {
    // API
    final response = await _client.delete(
      url: ('http://10.0.2.2:8080/api/propostas/delete/$id'),
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );
    // Success Case
    if (response.statusCode == 200) {
      return "Offer with id $id deleted successfully!";
    } else if (response.statusCode == 404) {
      return 'Offer not found';
    } else {
      throw Exception(
          'Failed to delete the Offer, status code: ${response.statusCode}');
    }
  }
}