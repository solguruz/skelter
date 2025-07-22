import 'package:flutter_skeleton/gen/assets.gen.dart';
import 'package:flutter_skeleton/presentation/checkout/model/product_model.dart';

final List<ProductModel> sampleProducts = [
  ProductModel(
    image: Assets.images.cartItem1.path,
    title: 'Wireless Headphones',
    description: 'High-quality wireless headphones with noise cancellation.',
    category: 'Electronics',
    rating: 4.5,
    reviews: 120,
    availableQuantities: 50,
    price: 99.99,
    seller: 'TechStore',
  ),
  ProductModel(
    image: Assets.images.cartItem2.path,
    title: 'Smartphone',
    description: 'Latest model smartphone with advanced features.',
    category: 'Electronics',
    rating: 4.7,
    reviews: 200,
    availableQuantities: 30,
    price: 699.99,
    seller: 'MobileWorld',
  ),
  ProductModel(
    image: Assets.images.cartItem1.path,
    title: 'Running Shoes',
    description: 'Comfortable and durable running shoes for all terrains.',
    category: 'Sportswear',
    rating: 4.3,
    reviews: 85,
    availableQuantities: 100,
    price: 59.99,
    seller: 'Sporty',
  ),
  ProductModel(
    image: Assets.images.cartItem1.path,
    title: 'Backpack',
    description: 'Stylish and spacious backpack for daily use.',
    category: 'Accessories',
    rating: 4.6,
    reviews: 150,
    availableQuantities: 75,
    price: 39.99,
    seller: 'BagStore',
  ),
  ProductModel(
    image: Assets.images.cartItem1.path,
    title: 'Smartwatch',
    description: 'Feature-packed smartwatch with fitness tracking.',
    category: 'Electronics',
    rating: 4.4,
    reviews: 95,
    availableQuantities: 40,
    price: 149.99,
    seller: 'GadgetHub',
  ),
  ProductModel(
    image: Assets.images.cartItem1.path,
    title: 'Gaming Chair',
    description: 'Ergonomic gaming chair with adjustable features.',
    category: 'Furniture',
    rating: 4.8,
    reviews: 60,
    availableQuantities: 20,
    price: 199.99,
    seller: 'FurniWorld',
  ),
  ProductModel(
    image: Assets.images.cartItem1.path,
    title: 'Electric Kettle',
    description: 'Fast-boiling electric kettle with auto shut-off.',
    category: 'Home Appliances',
    rating: 4.2,
    reviews: 110,
    availableQuantities: 80,
    price: 29.99,
    seller: 'HomeEssentials',
  ),
  ProductModel(
    image: Assets.images.cartItem1.path,
    title: 'Yoga Mat',
    description: 'Non-slip yoga mat for comfortable workouts.',
    category: 'Fitness',
    rating: 4.5,
    reviews: 70,
    availableQuantities: 150,
    price: 19.99,
    seller: 'FitGear',
  ),
  ProductModel(
    image: Assets.images.cartItem1.path,
    title: 'Bluetooth Speaker',
    description: 'Portable Bluetooth speaker with excellent sound quality.',
    category: 'Electronics',
    rating: 4.6,
    reviews: 140,
    availableQuantities: 60,
    price: 49.99,
    seller: 'SoundWave',
  ),
  ProductModel(
    image: Assets.images.cartItem1.path,
    title: 'Desk Lamp',
    description: 'LED desk lamp with adjustable brightness.',
    category: 'Home Decor',
    rating: 4.3,
    reviews: 90,
    availableQuantities: 120,
    price: 24.99,
    seller: 'BrightHome',
  ),
];

final List<ProductModel> testProducts = [
  // Short Title Test Case
  ProductModel(
    image: Assets.images.cartItem1.path,
    title: 'Island Pink Kush Oil',
    description: 'High-quality organic oil for better health.',
    category: 'Essentials',
    rating: 4.5,
    reviews: 1234,
    availableQuantities: 50,
    price: 150,
    seller: 'Pure Hemp',
  ),

  // Long Title Test Case
  ProductModel(
    image: Assets.images.cartItem1.path,
    title:
        'Island Pink Kush Oil - 100% Organic Hemp Extract for Health Benefits',
    description: 'High-quality organic oil for better health.',
    category: 'Essentials',
    rating: 4.5,
    reviews: 1234,
    availableQuantities: 50,
    price: 150,
    seller: 'Pure Hemp',
  ),

  // Emoji in Title Test Case
  ProductModel(
    image: Assets.images.cartItem1.path,
    title: '🧪 Emoji test 🌟',
    description: 'Test with emojis!',
    category: 'Fun',
    rating: 0,
    reviews: 0,
    availableQuantities: 0,
    price: 0,
    seller: 'UnicodeCo',
  ),

  // No Rating Test Case
  ProductModel(
    image: Assets.images.cartItem1.path,
    title: 'Island Pink Kush Oil',
    description: 'High-quality organic oil for better health.',
    category: 'Essentials',
    rating: 0.0,
    reviews: 0,
    availableQuantities: 50,
    price: 150,
    seller: 'Pure Hemp',
  ),

  // 3-Star Rating Test Case
  ProductModel(
    image: Assets.images.cartItem1.path,
    title: 'Island Pink Kush Oil',
    description: 'High-quality organic oil for better health.',
    category: 'Essentials',
    rating: 3.0,
    reviews: 1234,
    availableQuantities: 50,
    price: 150,
    seller: 'Pure Hemp',
  ),

  // Price with No Decimals Test Case
  ProductModel(
    image: Assets.images.cartItem1.path,
    title: 'Island Pink Kush Oil',
    description: 'High-quality organic oil for better health.',
    category: 'Essentials',
    rating: 4.5,
    reviews: 1234,
    availableQuantities: 50,
    price: 150,
    seller: 'Pure Hemp',
  ),

  // Price with Decimals Test Case
  ProductModel(
    image: Assets.images.cartItem1.path,
    title: 'Island Pink Kush Oil',
    description: 'High-quality organic oil for better health.',
    category: 'Essentials',
    rating: 4.5,
    reviews: 1234,
    availableQuantities: 50,
    price: 99.99,
    seller: 'Pure Hemp',
  ),

  // Quantity = 1 Test Case
  ProductModel(
    image: Assets.images.cartItem1.path,
    title: 'Island Pink Kush Oil',
    description: 'High-quality organic oil for better health.',
    category: 'Essentials',
    rating: 4.5,
    reviews: 1234,
    availableQuantities: 50,
    price: 150,
    seller: 'Pure Hemp',
  ),

  // Quantity = 100 Test Case
  ProductModel(
    image: Assets.images.cartItem1.path,
    title: 'Island Pink Kush Oil',
    description: 'High-quality organic oil for better health.',
    category: 'Essentials',
    rating: 4.5,
    reviews: 1234,
    availableQuantities: 100,
    price: 150,
    seller: 'Pure Hemp',
  ),

  // Valid Delivery Date Test Case
  ProductModel(
    image: Assets.images.cartItem1.path,
    title: 'Island Pink Kush Oil',
    description: 'High-quality organic oil for better health.',
    category: 'Essentials',
    rating: 4.5,
    reviews: 1234,
    availableQuantities: 50,
    price: 150,
    seller: 'Pure Hemp',
  ),

  // No Delivery Date Test Case
  ProductModel(
    image: Assets.images.cartItem1.path,
    title: 'Island Pink Kush Oil',
    description: 'High-quality organic oil for better health.',
    category: 'Essentials',
    rating: 4.5,
    reviews: 1234,
    availableQuantities: 50,
    price: 150,
    seller: 'Pure Hemp',
  ),

  // Product category with small letters Test Case
  ProductModel(
    image: Assets.images.cartItem1.path,
    title: 'Island Pink Kush Oil',
    description: 'High-quality organic oil for better health.',
    category: 'Essentials',
    rating: 4.5,
    reviews: 1234,
    availableQuantities: 50,
    price: 150,
    seller: 'Pure Hemp',
  ),

// Product category with long name Test Case
  ProductModel(
    image: Assets.images.cartItem1.path,
    title: 'Super Premium Deluxe Product',
    description: 'A premium product with extensive features and capabilities.',
    category: 'Professional Grade Electronics & Accessories',
    rating: 4.5,
    reviews: 1234,
    availableQuantities: 50,
    price: 150,
    seller: 'Premium Electronics Store',
  ),
];
