import 'package:get_storage/get_storage.dart';

class JLocalStorage {
  static final JLocalStorage _instance = JLocalStorage._internal();

  factory JLocalStorage() {
    return _instance;
  }

  JLocalStorage._internal();

  final _storage = GetStorage();

  //Generic method to SAVE Data

  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  //Generic Method to READ Data

  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  //Generic method to REMOVE data

  Future<void> removeDate<T>(String key) {
    return _storage.remove(key);
  }

  //Generic method to CLEARALL data

  Future<void> clearAll() async {
    await _storage.erase();
  }
}
