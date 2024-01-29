import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/services/firebase_storage_service.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(6)
          .get();

      return snapshot.docs
          .map((document) => ProductModel.fromSnapshot(document))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .get();

      return snapshot.docs
          .map((document) => ProductModel.fromSnapshot(document))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      final storage = Get.put(FirebaseStorageService());

      for (var product in products) {
        List<String> imgUrls = [];

        //Iterate images inside product
        if (product.images != null && product.images!.isNotEmpty) {
          for (var i = 0; i < product.images!.length; i++) {
            final productImage =
                await storage.getImageDataFromAssets(product.images![i]);

            final url = await storage.uploadImageData(
                'Products/${product.title}/Images',
                productImage,
                '${product.title}_images_$i');
            imgUrls.add(url);
          }
        }

        final productThumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);

        final productThumbnailUrl = await storage.uploadImageData(
            'Products/${product.title}/Thumbnail',
            productThumbnail,
            product.title);

        product.images = imgUrls;
        product.thumbnail = productThumbnailUrl;

        if (product.productVariations != null &&
            product.productVariations!.isNotEmpty) {
          for (var i = 0; i < product.productVariations!.length; i++) {
            final variationImage = await storage
                .getImageDataFromAssets(product.productVariations![i].image);
            final variationImageUrl = await storage.uploadImageData(
                'Products/${product.title}/Variations',
                variationImage,
                '${product.title}_images_$i');

            product.productVariations![i].image = variationImageUrl;
          }
        }

        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  Future<List<ProductModel>> fetchProductByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();

      return productList;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
}
