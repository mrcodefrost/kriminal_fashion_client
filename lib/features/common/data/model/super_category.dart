// class SuperCategoryModel {
//   String id;
//   String name;
//
//   SuperCategoryModel({
//     required this.id,
//     required this.name,
//   });
//
//   factory SuperCategoryModel.fromJson(Map<String, dynamic> json) {
//     return SuperCategoryModel(
//       id: json['id'],
//       name: json['name'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     return data;
//   }
// }

// Super categories
enum SuperCategory { woman, man, kids, beauty }

List<String> superCategoriesList = SuperCategory.values.map((category) => category.name.toUpperCase()).toList();
