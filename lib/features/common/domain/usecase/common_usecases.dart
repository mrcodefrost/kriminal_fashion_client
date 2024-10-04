import '../../../product/data/model/product_category.dart';

// sort out and return a list of product categories that belong to a specific  super category
List<ProductCategory> filterProductCategoryBySuperCategory(
    String superCategory, List<ProductCategory> allProductCategories) {
  return allProductCategories.where((productCategory) => productCategory.superCategory == superCategory).toList();
}

// convert ProductCategory list to string list to get names only
List<String> productCategoryListToStringList(List<ProductCategory> productCategories) {
  return productCategories.map((productCategory) => productCategory.name).toList();
}

List<String> getFilteredProductListForDropdown(
    List<ProductCategory> allProductCategories, String selectedSuperCategory) {
  if (selectedSuperCategory.isNotEmpty) {
    final productCategoryList = filterProductCategoryBySuperCategory(selectedSuperCategory, allProductCategories);

    return productCategoryListToStringList(productCategoryList);
  }
  return [];
}
