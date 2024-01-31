import 'package:ecommerce/data/dummy_data.dart';
import 'package:ecommerce/data/repositories/banner_repository/banner_repository.dart';
import 'package:ecommerce/data/repositories/brand_category_repository/brand_category_repository.dart';
import 'package:ecommerce/data/repositories/brands_repository/brands_repository.dart';
import 'package:ecommerce/data/repositories/category_repository/category_repository.dart';
import 'package:ecommerce/data/repositories/product_category_repository/product_category_repository.dart';
import 'package:ecommerce/data/repositories/products_repository/products_repository.dart';
import 'package:ecommerce/utils/contants/image_strings.dart';
import 'package:ecommerce/utils/helpers/network_manager.dart';
import 'package:ecommerce/utils/popup/full_screen_loader.dart';
import 'package:ecommerce/utils/popup/loaders.dart';
import 'package:get/get.dart';

class LoadDataController extends GetxController {
  static LoadDataController get instance => Get.find();

  final categoryRepository = Get.put(CategoryRepository());
  final bannerRepository = Get.put(BannerRepository());
  final brandRepository = Get.put(BrandRepository());
  final productRepository = Get.put(ProductRepository());
  final productCategoryRepository = Get.put(ProductCategoryRepository());
  final brandCategoryRepository = Get.put(BrandCategoryRepository());

  Future<void> loadCategories() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Uploading dummy categories data...', TImages.docerAnimation);

      //Check Internet
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await categoryRepository.uploadDummyData(DummyData.categories);

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
          title: 'Success', message: 'Dummy data uploaded!');
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }

  Future<void> loadBanners() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Uploading dummy banners data...', TImages.docerAnimation);

      //Check Internet
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await bannerRepository.uploadDummyData(DummyData.banners);

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
          title: 'Success', message: 'Dummy data uploaded!');
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }

  Future<void> loadBrands() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Uploading dummy brands data...', TImages.docerAnimation);

      //Check Internet
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await brandRepository.uploadDummyData(DummyData.brands);

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
          title: 'Success', message: 'Dummy data uploaded!');
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }

  Future<void> loadProducts() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Uploading dummy products data...', TImages.docerAnimation);

      //Check Internet
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await productRepository.uploadDummyData(DummyData.products);

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
          title: 'Success', message: 'Dummy data uploaded!');
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }

  Future<void> loadBrandCategory() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Uploading dummy brand category relation data...',
          TImages.docerAnimation);

      //Check Internet
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await brandCategoryRepository.uploadDummyData(DummyData.brandCategory);

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
          title: 'Success', message: 'Dummy data uploaded!');
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }

  Future<void> loadProductCategory() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Uploading dummy product category relation data...',
          TImages.docerAnimation);

      //Check Internet
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await productCategoryRepository
          .uploadDummyData(DummyData.productCategory);

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
          title: 'Success', message: 'Dummy data uploaded!');
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }
}
