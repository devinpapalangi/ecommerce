import 'package:ecommerce/data/repositories/brands_repository/brands_repository.dart';
import 'package:ecommerce/data/repositories/products_repository/products_repository.dart';
import 'package:ecommerce/features/shop/models/brand_model.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/popup/loaders.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  static BrandController get instancee => Get.find();

  final RxList<BrandModel> brands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());
  final productRepository = Get.put(ProductRepository());
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchBrands();
    super.onInit();
  }

  Future fetchBrands() async {
    try {
      isLoading.value = true;
      final fetchedBrands = await brandRepository.getFeaturedBrands();

      brands.assignAll(fetchedBrands);
      featuredBrands.assignAll(
          brands.where((brand) => brand.isFeatured ?? false).take(4));
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      await brandRepository.getBrandsForCategory(categoryId);
      return brands;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> getBrandProducts(
      {required brandId, int limit = -1}) async {
    try {
      final products =
          await productRepository.getProductForBrand(brandId: brandId);

      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
      return [];
    }
  }
}
