import 'package:flutter/material.dart';

class CategoryModel with ChangeNotifier{
  int? id;
  String? name;
  String? image;

  CategoryModel({this.id, this.name, this.image});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  static List<CategoryModel> categoryFromSnapshot(List categorySnapshot) {
//  print("data $productSnapshot[0]");
    return categorySnapshot.map((data) {
      return CategoryModel.fromJson(data);
    }).toList();
  }
}
