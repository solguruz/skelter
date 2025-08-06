import 'dart:convert';

import 'package:flutter_skeleton/presentation/home/domain/entities/product.dart';
import 'package:flutter_skeleton/utils/typedef.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.category,
    required super.image,
    required super.rating,
    required super.reviews,
    required super.availableQuantities,
    required super.seller,
  });

  ProductModel copyWith({
    String? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    double? rating,
    int? reviews,
    int? availableQuantities,
    String? seller,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      reviews: reviews ?? this.reviews,
      availableQuantities: availableQuantities ?? this.availableQuantities,
      seller: seller ?? this.seller,
    );
  }

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(jsonDecode(source) as DataMap);

  ProductModel.fromMap(DataMap map)
      : this(
          id: map['id'] as String,
          title: map['title'] as String,
          price: (map['price'] is int)
              ? (map['price'] as int).toDouble()
              : map['price'] as double,
          description: map['description'] as String,
          category: map['category'] as String,
          image: map['image'] as String,
          rating: map['rating'] as double,
          reviews: map['reviews'] as int,
          availableQuantities: map['availableQuantities'] as int,
          seller: map['seller'] as String,
        );

  DataMap toMap() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
        'rating': rating,
        'reviews': reviews,
        'availableQuantities': availableQuantities,
        'seller': seller,
      };

  String toJson() => jsonEncode(toMap());
}
