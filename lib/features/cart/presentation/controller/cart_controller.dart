import 'package:get/get.dart';

import '../../../product/data/model/product.dart';

class CartController extends GetxController {
  var selectedIndex = 0.obs;

  RxList<Product> wishListedProducts = <Product>[].obs;

  void switchView(int index) {
    selectedIndex.value = index;
  }

  // Future<void> fetchWishListedProducts() async {
  //   try {
  //     QuerySnapshot productSnapshot = await productCollection.get();
  //     final List<Product> retrievedProducts =
  //         productSnapshot.docs.map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>)).toList();
  //     // clearing the local list to avoid multiple entries
  //     products.clear();
  //     products.assignAll(retrievedProducts);
  //     // to make the entire wish listed product list be available
  //     wishListedProducts.assignAll(products);
  //   } catch (e) {
  //     Get.snackbar('Error', e.toString(), colorText: Colors.red);
  //     debugPrint(e.toString());
  //   } finally {
  //     // super important - always call update() in such cases of statelessness
  //     // basically any change in UI
  //     update();
  //   }
  // }
}
