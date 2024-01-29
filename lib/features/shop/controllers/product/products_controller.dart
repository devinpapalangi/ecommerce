import 'package:ecommerce/data/repositories/products_repository/products_repository.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/contants/enums.dart';
import 'package:ecommerce/utils/popup/loaders.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  final isLoading = false.obs;

  final productRepository = Get.put(ProductRepository());

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;

      final products = await productRepository.getFeaturedProducts();

      featuredProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllProducts() async {
    try {
      final products = await productRepository.getAllFeaturedProducts();

      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
      return [];
    }
  }

  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0.0 ? product.salePrice : product.price)
          .toString();
    } else {
      for (var variation in product.productVariations!) {
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }

        if (priceToConsider > smallestPrice) {
          largestPrice = priceToConsider;
        }
      }

      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        return '$smallestPrice - \$$largestPrice';
      }
    }
  }

  String? calculateSalePrecentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;

    return percentage.toStringAsFixed(0);
  }

  String getProductStocStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
