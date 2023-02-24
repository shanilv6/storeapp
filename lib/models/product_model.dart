import 'package:flutter/material.dart';

import 'categories_model.dart';

class ProductModel with ChangeNotifier {
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  CategoryModel? category;

  ProductModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.images,
      this.category});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    images = json['images'].cast<String>();
    category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
  }

  static List<ProductModel> productsFromSnapshot(List productSnapshot) {
//  print("data $productSnapshot[0]");
    return productSnapshot.map((data) {
      return ProductModel.fromJson(data);
    }).toList();
  }
}
