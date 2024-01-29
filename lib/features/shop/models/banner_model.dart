import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String imageUrl;
  String targetScreen;
  bool active;

  BannerModel({
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });

  static BannerModel empty() =>
      BannerModel(imageUrl: '', targetScreen: '', active: false);

  Map<String, dynamic> toJson() {
    return {
      'ImageUrl': imageUrl,
      'TargetScreen': targetScreen,
      'Active': active
    };
  }

  factory BannerModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return BannerModel(
        imageUrl: data['ImageUrl'] ?? '',
        targetScreen: data['TargetScreen'] ?? '',
        active: data['Active'] ?? false,
      );
    }
    return BannerModel.empty();
  }
}
