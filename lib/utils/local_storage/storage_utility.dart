import 'package:get_storage/get_storage.dart';

class TFCLocalStorage {
  static final TFCLocalStorage _instance = TFCLocalStorage._internal();

  factory TFCLocalStorage() {
    return _instance;
  }

  TFCLocalStorage._internal();

  final _storage = GetStorage();

  // Generic Method to save data
  Future<void> saveData<D>(String key, D value) async {
    await _storage.write(key, value);
  }

  // Generic method to read data
  D? readData<D>(String key) {
    return _storage.read<D>(key);
  }

  // Genetic method to delete data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // Clear all data in storage
  Future<void> clearAll() async {
    await _storage.erase();
  }
}