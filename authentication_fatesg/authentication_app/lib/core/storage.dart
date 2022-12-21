import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class Storage {
  static late Box _storage;

  static loadStorage() async {
    await Hive.initFlutter();
    _storage = await Hive.openBox('storage');
  }
  static delete(String key) {
    _storage.delete(key);
  }

  static save(String key, dynamic value) {
    return _storage.put(key, value);
  }

  static read(String key) {
    return _storage.get(key, defaultValue: "");
  }
}