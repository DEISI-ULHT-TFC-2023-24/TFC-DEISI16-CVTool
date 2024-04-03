import 'package:intl/intl.dart';

class TFCFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MM-yyyy').format(date); // Customized Date
  }
}