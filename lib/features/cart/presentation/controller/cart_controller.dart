import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_client/utils/globals.dart';

import '../../../product/data/model/product.dart';

class CartController extends GetxController {
  // ====== INSTANCES ====== //

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;
  late CollectionReference cartCollection;
  late CollectionReference wishlistCollection;

  var selectedIndex = 0.obs;
  RxList<Product> wishListedProducts = <Product>[].obs;

  void switchView(int index) {
    selectedIndex.value = index;
  }

  void addOrRemoveFromWishlist(Product product) {
    if (wishListedProducts.contains(product)) {
      wishListedProducts.remove(product); // Remove from wishlist
    } else {
      wishListedProducts.add(product); // Add to wishlist
    }
  }

  bool isProductWishListed(Product product) {
    return wishListedProducts.contains(product);
  }

  // ====== STATES ====== //

  @override
  void onInit() {
    super.onInit();
    userCollection = firestore.collection('users');
  }

  // ====== CART CRUD ====== //

  // Future<void> addToCart() async {
  //   try {
  //     // Generate a unique ID for the cart item
  //     DocumentReference cartDocRef =
  //         userCollection.doc(userId).collection('cartItems').doc(); // Generate a unique cart item ID
  //
  //     cartItem.id = cartDocRef.id; // Assign the generated ID to the cart item
  //
  //     // Save the cart item to Firestore
  //     cartDocRef.set(cartItem.toJson()).then((_) {
  //       Get.snackbar('Success', 'Cart item added successfully', colorText: Colors.green);
  //     });
  //   } catch (e) {
  //     logg.e('Error adding to cart: $e');
  //   }
  // }

  Future<void> removeFromCart() async {}

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
