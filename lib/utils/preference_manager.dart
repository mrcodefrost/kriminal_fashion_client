import 'package:get_storage/get_storage.dart';

class PreferenceManager {
  static const String userId = "userId";
  static const String isPrefDarkMode = "isPrefDarkMode";

  static GetStorage getStorage() {
    return GetStorage();
  }

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

  static deleteData() async {
    getStorage().erase();
  }
}
