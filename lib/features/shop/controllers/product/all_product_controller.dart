import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/repositories/products_repository/products_repository.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/popup/loaders.dart';
import 'package:get/get.dart';

class AllProductController extends GetxController {
  static AllProductController get instance => Get.find();

  final repository = Get.put(ProductRepository());

  Future<List<ProductModel>> fetchProductByQuery(Query? query) async {
    try {
      if (query == null) return [];

      final products = await repository.fetchProductByQuery(query);

      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
      return [];
    }
  }
}
