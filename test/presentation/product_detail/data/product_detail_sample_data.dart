import 'package:skelter/presentation/product_detail/model/product_detail_model.dart';

ProductDetailModel generateSampleProductDetail() {
  return ProductDetailModel(
    title: 'Premium Wireless Headphones',
    description: '''
Experience crystal clear sound with our premium wireless headphones. 
Featuring active noise cancellation, 30-hour battery life, and comfortable 
over-ear design. Perfect for music lovers and professionals who demand 
the best audio experience.''',
    category: 'Electronics',
    price: 199.99,
    rating: 4.8,
    mainImage:
        'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600',
    additionalImages: [
      'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600',
      'https://images.unsplash.com/photo-1484704849700-f032a568e944?w=400',
      'https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=400',
      'https://images.unsplash.com/photo-1583394838336-acd977736f90?w=400',
    ],
  );
}
