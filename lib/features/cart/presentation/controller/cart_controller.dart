import 'package:get/get.dart';

class CartController extends GetxController {
  var selectedIndex = 0.obs;

  void switchView(int index) {
    selectedIndex.value = index;
  }
}
