import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/shop/models/brand_model.dart';
import 'package:ecommerce/features/shop/models/product_attribute_model.dart';
import 'package:ecommerce/features/shop/models/product_variation_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.stock,
    this.sku,
    required this.price,
    required this.title,
    this.date,
    required this.salePrice,
    required this.thumbnail,
    this.isFeatured,
    this.brand,
    this.description,
    this.categoryId,
    this.images,
    required this.productType,
    this.productAttributes,
    this.productVariations,
  });

  static ProductModel empty() => ProductModel(
        id: '',
        stock: 0,
        sku: null,
        price: 0.0,
        title: '',
        date: null,
        salePrice: 0.0,
        thumbnail: '',
        isFeatured: null,
        brand: null,
        description: null,
        categoryId: null,
        images: null,
        productType: '',
        productAttributes: null,
        productVariations: null,
      );

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Stock': stock,
      'Sku': sku,
      'Price': price,
      'Title': title,
      'Date': date?.toIso8601String(),
      'SalePrice': salePrice,
      'Thumbnail': thumbnail,
      'IsFeatured': isFeatured,
      'Brand': brand?.toJson(),
      'Description': description,
      'CategoryId': categoryId,
      'Images': images,
      'ProductType': productType,
      'ProductAttributes': productAttributes != null
          ? productAttributes!.map((attr) => attr.toJson()).toList()
          : [],
      'ProductVariations': productVariations != null
          ? productVariations!.map((attr) => attr.toJson()).toList()
          : []
    };
  }

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ProductModel(
        id: document.id,
        stock: data['Stock'] ?? 0,
        sku: data['Sku'],
        price: double.parse((data['Price'] ?? 0.0).toString()),
        title: data['Title'] ?? '',
        date: data['Date'] != null ? DateTime.parse(data['Date']) : null,
        salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
        thumbnail: data['Thumbnail'] ?? '',
        isFeatured: data['IsFeatured'],
        brand: BrandModel.fromJson(data['Brand']),
        description: data['Description'],
        categoryId: data['CategoryId'],
        images: data['Images'] != null ? List<String>.from(data['Images']) : [],
        productType: data['ProductType'] ?? '',
        productAttributes: (data['ProductAttributes'] as List<dynamic>)
            .map((e) => ProductAttributeModel.fromJson(e))
            .toList(),
        productVariations: (data['ProductVariations'] as List<dynamic>)
            .map((e) => ProductVariationModel.fromJson(e))
            .toList());
  }

  // Map Json-oriented document snapshot from Firebase to Model
  factory ProductModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      id: document.id,
      sku: data['SKU'] ?? '',
      title: data['Title'] ?? '',
      stock: data['Stock'] ?? 0,
      isFeatured: data['IsFeatured'] ?? false,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['Sale Price'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productType: data['Product Type'] ?? '',
      brand: BrandModel.fromJson(data['Brand']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: (data['ProductAttributes'] as List<dynamic>)
          .map((e) => ProductAttributeModel.fromJson(e))
          .toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>)
          .map((e) => ProductVariationModel.fromJson(e))
          .toList(),
    ); // Product Model
  }
}
