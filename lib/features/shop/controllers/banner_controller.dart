import 'package:ecommerce/data/repositories/banner_repository/banner_repository.dart';
import 'package:ecommerce/features/shop/models/banner_model.dart';
import 'package:ecommerce/utils/popup/loaders.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  final carouselCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final bannerRepository = Get.put(BannerRepository());

  final RxList<BannerModel> banners = <BannerModel>[].obs;

  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;
      final fetchedBanners = await bannerRepository.fetchBanners();

      banners.assignAll(fetchedBanners);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
