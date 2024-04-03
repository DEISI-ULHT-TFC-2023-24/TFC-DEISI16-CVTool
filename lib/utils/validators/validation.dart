
import 'package:get/get.dart';

class TFCValidator {
  static String? validateEmail(String? value) {
    // Null or Empty email given
    if (value == null || value.isEmpty) {
      return 'Requer um endereço email.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Email fornecido ínvalido.';
    }
    return null;
  }

  // Different password validators
  static String? validatePassword(String? value) {
    // Null or Empty password given
    if (value == null || value.isEmpty) {
      return 'Password ínvalida';
    }

    // Check the minimum password length
    if (value.length < 8) {
      return 'O comprimento da password é ínvalido.';
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%~&*(),.?":{}|<>]'))) {
      return 'A password deve conter pelo menos um caracter especial.';
    }
    return null;
  }

  // Phone number validators
  static String? validatePhoneNumber(String? value) {
    // Null or Empty Phone number given
    if (value == null || value.isEmpty) {
      return 'Requer um número de telemóvel';
    }

    // Only numeric Phone Number
    if (!value.isNumericOnly || value.length > 9) {
      return 'Número de telemóvel fornecido é ínvalido';
    }

    return null;
  }
}