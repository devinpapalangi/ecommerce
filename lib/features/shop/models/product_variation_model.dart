class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.sku = '',
    required this.image,
    this.description,
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });

  static ProductVariationModel empty() => ProductVariationModel(
        id: '',
        sku: '',
        image: '',
        description: null,
        price: 0.0,
        salePrice: 0.0,
        stock: 0,
        attributeValues: {},
      );

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Sku': sku,
      'Image': image,
      'Description': description,
      'Price': price,
      'SalePrice': salePrice,
      'Stock': stock,
      'AttributeValues': attributeValues,
    };
  }

  factory ProductVariationModel.fromSnapshot(
      Map<String, dynamic> variationData) {
    return ProductVariationModel(
      id: variationData['Id'] ?? '',
      sku: variationData['Sku'] ?? '',
      image: variationData['Image'] ?? '',
      description: variationData['Description'],
      price: variationData['Price'] ?? 0.0,
      salePrice: variationData['SalePrice'] ?? 0.0,
      stock: variationData['Stock'] ?? 0,
      attributeValues:
          Map<String, String>.from(variationData['AttributeValues'] ?? {}),
    );
  }

  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    return ProductVariationModel(
      id: data['Id'] ?? '',
      sku: data['Sku'] ?? '',
      image: data['Image'] ?? '',
      description: data['Description'],
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      stock: data['Stock'] ?? 0,
      attributeValues: Map<String, String>.from(data['AttributeValues'] ?? {}),
    );
  }
}
