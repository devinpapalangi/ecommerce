import 'package:ecommerce/data/repositories/brands_repository/brands_repository.dart';
import 'package:ecommerce/features/shop/models/brand_model.dart';
import 'package:ecommerce/utils/popup/loaders.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  static BrandController get instancee => Get.find();

  RxList<BrandModel> brands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());
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
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
