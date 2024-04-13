// Business company data model
import 'package:tfc_versaofinal/users/business/models/business_user_model.dart';

class BusinessCompany {
  String name;
  String email;
  String contact;
  List<BusinessUser>? workers = [];

  BusinessCompany({
    required this.name,
    required this.email,
    required this.contact,
  });
}
