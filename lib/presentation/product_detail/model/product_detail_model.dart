class ProductDetailModel {
  final String title;
  final String description;
  final String category;
  final double price;
  final double rating;
  final String mainImage;
  final List<String> additionalImages;

  ProductDetailModel({
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.rating,
    required this.mainImage,
    required this.additionalImages,
  });
}
