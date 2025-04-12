class ProductModel {
  final String image;
  final String title;
  final String description;
  final String category;
  final double rating;
  final int reviews;
  final int availableQuantities;
  final double price;
  final String seller;

  ProductModel({
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

  // Factory method to create a ProductModel from JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      image: json['image'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviews: json['reviews'] as int,
      availableQuantities: json['availableQuantities'] as int,
      price: (json['price'] as num).toDouble(),
      seller: json['seller'] as String,
    );
  }

  // Method to convert a ProductModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'description': description,
      'category': category,
      'rating': rating,
      'reviews': reviews,
      'availableQuantities': availableQuantities,
      'price': price,
      'seller': seller,
    };
  }
}
