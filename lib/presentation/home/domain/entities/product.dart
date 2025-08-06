import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.category,
    required this.rating,
    required this.reviews,
    required this.availableQuantities,
    required this.price,
    required this.seller,
  });

  final String id;
  final String image;
  final String title;
  final String description;
  final String category;
  final double rating;
  final int reviews;
  final int availableQuantities;
  final double price;
  final String seller;

  @override
  List<Object> get props => [
        id,
        image,
        title,
        description,
        category,
        rating,
        reviews,
        availableQuantities,
        price,
        seller,
      ];
}
