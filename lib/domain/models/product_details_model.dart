import 'package:freezed_annotation/freezed_annotation.dart';



@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    @JsonKey(name: 'id') String? id,

    @JsonKey(name: 'productCode') String? productCode,

    @JsonKey(name: 'name') String? name,

    @JsonKey(name: 'description') String? description,

    @JsonKey(name: 'nameArabic') String? nameArabic,

    @JsonKey(name: 'descriptionArabic') String? descriptionArabic,

    @JsonKey(name: 'coverPictureUrl') String? coverPictureUrl,

    @JsonKey(name: 'productPictures') List<String>? productPictures,

    @JsonKey(name: 'categories') List<String>? categories,

    @JsonKey(name: 'price') double? price,

    @JsonKey(name: 'stock') int? stock,

    @JsonKey(name: 'weight') double? weight,

    @JsonKey(name: 'color') String? color,

    @JsonKey(name: 'discountPercentage') double? discountPercentage,

    @JsonKey(name: 'rating') double? rating,

    @JsonKey(name: 'reviewsCount') int? reviewsCount,

    @JsonKey(name: 'sellerId') String? sellerId,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}