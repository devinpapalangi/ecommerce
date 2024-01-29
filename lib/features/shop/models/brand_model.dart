import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productsCount,
  });

  static BrandModel empty() => BrandModel(
      id: '', name: '', image: '', isFeatured: null, productsCount: null);

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'IsFeatured': isFeatured,
      'ProductsCount': productsCount,
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['Id'] ?? '',
      name: json['Name'] ?? '',
      image: json['Image'] ?? '',
      isFeatured: json['IsFeatured'],
      productsCount: json['ProductsCount'],
    );
  }

  factory BrandModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return BrandModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        isFeatured: data['IsFeatured'],
        productsCount: data['ProductsCount'],
      );
    }
    return BrandModel.empty();
  }
}
