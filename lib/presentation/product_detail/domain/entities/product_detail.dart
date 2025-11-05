import 'package:equatable/equatable.dart';

class ProductDetail extends Equatable {
  const ProductDetail({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    required this.productImages,
  });

  final String id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final double rating;
  final List<String> productImages;

  @override
  List<Object> get props => [
        id,
        title,
        price,
        description,
        category,
        image,
        rating,
        productImages,
      ];
}
