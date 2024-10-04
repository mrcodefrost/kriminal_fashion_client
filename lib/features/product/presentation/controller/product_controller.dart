import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/product.dart';
import '../../data/model/product_category.dart';

class ProductController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;
  late CollectionReference categoryCollection;

  RxList<Product> products = <Product>[].obs; // main list
  RxList<Product> filteredProducts = <Product>[].obs; // list updated based on filters
  RxList<ProductCategory> productCategories = <ProductCategory>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    productCollection = firestore.collection('products');
    categoryCollection = firestore.collection('categories');
    await fetchCategories();
    await fetchProducts();
  }

  Future<void> onRefresh() async {
    await fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product> retrievedProducts =
          productSnapshot.docs.map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>)).toList();
      // clearing the local list to avoid multiple entries
      products.clear();
      products.assignAll(retrievedProducts);
      // to make the entire product list be available
      filteredProducts.assignAll(products);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      debugPrint(e.toString());
    } finally {
      // super important - always call update() in such cases of statelessness
      // basically any change in UI
      update();
    }
  }

  Future<void> fetchCategories() async {
    try {
      QuerySnapshot categorySnapshot = await categoryCollection.get();
      final List<ProductCategory> retrievedCategories =
          categorySnapshot.docs.map((doc) => ProductCategory.fromJson(doc.data() as Map<String, dynamic>)).toList();
      // clearing the local list to avoid multiple entries
      productCategories.clear();
      productCategories.assignAll(retrievedCategories);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      debugPrint(e.toString());
    } finally {
      // super important - always call update() in such cases of statelessness
      update();
    }
  }

  void filterByCategory(String category) {
    filteredProducts.clear();
    filteredProducts.value = products.where((product) => product.category == category).toList();
    update();
  }

  // void filterByBrand(List<String> brands) {
  //   if (brands.isEmpty) {
  //     filteredProducts = products;
  //   } else {
  //     List<String> lowerCaseBrands = brands.map((brand) => brand.toLowerCase()).toList();
  //     filteredProducts.value =
  //         products.where((product) => lowerCaseBrands.contains(product.brand?.toLowerCase() ?? 'unbranded')).toList();
  //   }
  //   update();
  // }

  void sortByPrice({required bool ascending}) {
    List<Product> sortedProducts = List<Product>.from(filteredProducts);
    sortedProducts
        .sort((current, next) => ascending ? current.price.compareTo(next.price) : next.price.compareTo(current.price));
    filteredProducts.value = sortedProducts;
    update();
  }
}
