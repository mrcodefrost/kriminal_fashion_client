import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_client/features/cart/data/models/cart_item.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/widgets/loading_dialog.dart';
import 'package:kriminal_fashion_client/utils/globals.dart';
import 'package:kriminal_fashion_client/utils/preference_manager.dart';

import '../../../product/data/model/product.dart';

class CartController extends GetxController {
  // ====== INSTANCES ====== //

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;
  late CollectionReference cartCollection;
  late CollectionReference wishlistCollection;

  // ====== VARIABLES ====== //

  var selectedIndex = 0.obs;
  RxList<Product> wishListedProducts = <Product>[].obs;
  RxList<CartItem> cartItems = <CartItem>[].obs;

  // ====== STATES ====== //

  @override
  void onInit() {
    super.onInit();
    userCollection = firestore.collection('users');
  }

  // ====== FUNCTIONS ====== //

  void switchView(int index) {
    selectedIndex.value = index;
  }

  double get totalPrice {
    return cartItems.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  // ====== WISHLIST CRUD ====== //

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

  // Todo
  // Add to wishlist API
  // Remove from wishlist API

  // ====== CART CRUD ====== //

  Stream<List<CartItem>> streamCartItems() {
    String userId = PreferenceManager.getData(PreferenceManager.userId);

    return userCollection
        .doc(userId)
        .collection('cartItems')
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs.map((doc) {
              return CartItem.fromJson(doc.data());
            }).toList());
  }

  Stream<int> streamCartItemCount() {
    String userId = PreferenceManager.getData(PreferenceManager.userId);

    return userCollection
        .doc(userId)
        .collection('cartItems')
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs.length);
  }

  Future<void> addToCart(Product product) async {
    try {
      LoadingDialog.showProgressIndicatorAlertDialog();
      String userId = PreferenceManager.getData(PreferenceManager.userId);
      logg.d(userId, error: 'Item added in cart for UUID');

      // If product already in cart then increment the quantity
      CollectionReference cartItemsCollection =
          userCollection.doc(userId).collection('cartItems');
      QuerySnapshot querySnapshot = await cartItemsCollection
          .where('productId', isEqualTo: product.id)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot existingCartItem = querySnapshot.docs.first;

        double currentQuantity = existingCartItem['quantity'] ?? 0;
        await cartItemsCollection.doc(existingCartItem.id).update({
          'quantity': currentQuantity + 1,
        });
        LoadingDialog.removeProgressIndicatorAlertDialog();
        Get.snackbar('Success', 'Quantity updated successfully',
            colorText: Colors.green);
      }

      // If product not in cart then add it
      else {
        // Generate a unique ID for the cart item
        DocumentReference cartDocRef = userCollection
            .doc(userId)
            .collection('cartItems')
            .doc(); // Generate a unique cart item ID

        CartItem cartItem = CartItem(
          id: cartDocRef.id, // Assign the generated ID to the cart item
          productId: product.id,
          name: product.name,
          image: product.image,
          price: product.price,
          quantity: 1,
        );

        final cartItemJson = cartItem.toJson();
        await cartDocRef.set(cartItemJson);
        LoadingDialog.removeProgressIndicatorAlertDialog();
        Get.snackbar('Success', 'Cart item added successfully',
            colorText: Colors.green);
      }
    } catch (e) {
      logg.e('Error adding to cart: $e');
    }
  }

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
