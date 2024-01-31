import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/shop/models/product_category_model.dart';
import 'package:ecommerce/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductCategoryRepository extends GetxController {
  static ProductCategoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> uploadDummyData(
      List<ProductCategoryModel> categoryProducts) async {
    try {
      for (var categoryProduct in categoryProducts) {
        await _db
            .collection('ProductCategory')
            .doc()
            .set(categoryProduct.toJson());
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
}
