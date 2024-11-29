import 'package:get_storage/get_storage.dart';

class PreferenceManager {
  static setObjectData(String key, dynamic value) async {
    final jsonValue = value.toJson();
    getStorage().write(key, jsonValue);
  }

  static setData(String key, dynamic value) async {
    getStorage().write(key, value);
  }

  static dynamic getData(String key) {
    return getStorage().read(key);
  }

  static GetStorage getStorage() {
    return GetStorage();
  }

  static deleteData() async {
    getStorage().erase();
  }
}
