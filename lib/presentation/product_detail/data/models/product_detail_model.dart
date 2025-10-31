import 'dart:convert';
import 'package:skelter/presentation/product_detail/domain/entities/product_detail.dart';
import 'package:skelter/utils/typedef.dart';

class ProductDetailModel extends ProductDetail {
  const ProductDetailModel({
    required super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.category,
    required super.image,
    required super.rating,
    required super.productImages,
  });

  ProductDetailModel copyWith({
    String? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    double? rating,
    List<String>? productImages,
  }) {
    return ProductDetailModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      productImages: productImages ?? this.productImages,
    );
  }

  factory ProductDetailModel.fromJson(String source) =>
      ProductDetailModel.fromMap(jsonDecode(source) as DataMap);

  factory ProductDetailModel.fromMap(DataMap map) => ProductDetailModel(
        id: map['id'] as String,
        title: map['title'] as String,
        price: (map['price'] is int)
            ? (map['price'] as int).toDouble()
            : map['price'] as double,
        description: map['description'] as String,
        category: map['category'] as String,
        image: map['image'] as String,
        rating: (map['rating'] is int)
            ? (map['rating'] as int).toDouble()
            : map['rating'] as double,
        productImages:
            (map['productImages'] as List).map((e) => e as String).toList(),
      );

  DataMap toMap() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
        'rating': rating,
        'productImages': productImages,
      };

  String toJson() => jsonEncode(toMap());
}
