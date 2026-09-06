import 'package:flutter/material.dart';

class CategoryItem {
  const CategoryItem({
    required this.name,
    required this.iconPath,
    required this.color,
  });

  final String name;
  final String iconPath;
  final Color color;
}

class ProductCategory {
  const ProductCategory({
    required this.title,
    required this.products,
  });

  final String title;
  final List<ProductItem> products;
}

class ProductItem {
  const ProductItem({
    required this.name,
    required this.imagePath,
    required this.description,
    required this.price,
  });

  final String name;
  final String imagePath;
  final String description;
  final String price;
}

const List<CategoryItem> categories = [
  CategoryItem(
    name: 'Beauty',
    iconPath: 'assets/icons/cosmetics.png',
    color: Color(0xFFFF9800),
  ),
  CategoryItem(
    name: 'Baby',
    iconPath: 'assets/icons/baby.png',
    color: Color(0xFF4D60C8),
  ),
  CategoryItem(
    name: 'Electronics',
    iconPath: 'assets/icons/plug.png',
    color: Color(0xFF4EAA59),
  ),
  CategoryItem(
    name: 'Kitchen',
    iconPath: 'assets/icons/spoon-and-fork.png',
    color: Color(0xFF4B95F7),
  ),
  CategoryItem(
    name: 'Medical',
    iconPath: 'assets/icons/medicine.png',
    color: Color(0xFFFF6B2C),
  ),
];

const List<ProductCategory> productCategories = [
  ProductCategory(
    title: 'Beauty',
    products: [
      ProductItem(
        name: 'Eye Serum',
        imagePath: 'assets/images/eye_serum.webp',
        description: 'Hydrating serum for fresh under eyes.',
        price: 'Rs. 349',
      ),
      ProductItem(
        name: 'Kajal Beauty',
        imagePath: 'assets/images/kajal_beauty.webp',
        description: 'Smudge-proof kajal for bold daily looks.',
        price: 'Rs. 199',
      ),
      ProductItem(
        name: 'Lip Balm',
        imagePath: 'assets/images/lipbalm.webp',
        description: 'Soft moisturizing balm for dry lips.',
        price: 'Rs. 149',
      ),
      ProductItem(
        name: 'Lip Liner',
        imagePath: 'assets/images/lip_linner.webp',
        description: 'Smooth liner for clean lip shape.',
        price: 'Rs. 249',
      ),
      ProductItem(
        name: 'Makeup Powder',
        imagePath: 'assets/images/makeup_powder.webp',
        description: 'Lightweight powder for an even finish.',
        price: 'Rs. 399',
      ),
      ProductItem(
        name: 'Under Roller',
        imagePath: 'assets/images/underroller.webp',
        description: 'Cooling roller for tired under eyes.',
        price: 'Rs. 299',
      ),
    ],
  ),
  ProductCategory(
    title: 'Baby',
    products: [
      ProductItem(
        name: 'Baby Blanket',
        imagePath: 'assets/images/baby_blanket.webp',
        description: 'Soft cozy blanket for newborn comfort.',
        price: 'Rs. 699',
      ),
      ProductItem(
        name: 'Baby Lotion',
        imagePath: 'assets/images/baby_loation.webp',
        description: 'Gentle lotion for soft baby skin.',
        price: 'Rs. 299',
      ),
      ProductItem(
        name: 'Milk Bottle',
        imagePath: 'assets/images/baby_milk_bottle.webp',
        description: 'Easy-grip feeding bottle for babies.',
        price: 'Rs. 249',
      ),
      ProductItem(
        name: 'Nail Cutter',
        imagePath: 'assets/images/baby_nailcutter.webp',
        description: 'Safe nail cutter for tiny nails.',
        price: 'Rs. 129',
      ),
      ProductItem(
        name: 'Baby Toys',
        imagePath: 'assets/images/baby_toys.webp',
        description: 'Colorful toys for early playtime.',
        price: 'Rs. 499',
      ),
      ProductItem(
        name: 'Wipes',
        imagePath: 'assets/images/wipes.webp',
        description: 'Gentle wet wipes for daily care.',
        price: 'Rs. 199',
      ),
    ],
  ),
  ProductCategory(
    title: 'Electronics',
    products: [
      ProductItem(
        name: 'Camera',
        imagePath: 'assets/images/camera.jpg',
        description: 'Compact camera for sharp memories.',
        price: 'Rs. 24,999',
      ),
      ProductItem(
        name: 'Headphone',
        imagePath: 'assets/images/headphone.jpg',
        description: 'Comfort headphones with clear sound.',
        price: 'Rs. 1,499',
      ),
      ProductItem(
        name: 'Laptop',
        imagePath: 'assets/images/laptop.jpg',
        description: 'Fast laptop for work and study.',
        price: 'Rs. 49,999',
      ),
      ProductItem(
        name: 'Mouse',
        imagePath: 'assets/images/mouse.jpg',
        description: 'Responsive wireless mouse.',
        price: 'Rs. 599',
      ),
      ProductItem(
        name: 'Neckband',
        imagePath: 'assets/images/neckband.jpg',
        description: 'Lightweight neckband for music calls.',
        price: 'Rs. 899',
      ),
      ProductItem(
        name: 'Power Bank',
        imagePath: 'assets/images/power_bank.jpg',
        description: 'Portable backup charger for travel.',
        price: 'Rs. 1,299',
      ),
      ProductItem(
        name: 'Watch',
        imagePath: 'assets/images/watch.jpg',
        description: 'Smart watch with fitness tracking.',
        price: 'Rs. 2,499',
      ),
    ],
  ),
  ProductCategory(
    title: 'Kitchen',
    products: [
      ProductItem(
        name: 'Cooker',
        imagePath: 'assets/images/cooker.jpg',
        description: 'Durable pressure cooker for daily meals.',
        price: 'Rs. 1,899',
      ),
      ProductItem(
        name: 'Egg Frier',
        imagePath: 'assets/images/egg_frier.jpg',
        description: 'Compact pan for quick egg dishes.',
        price: 'Rs. 499',
      ),
      ProductItem(
        name: 'Kadahi',
        imagePath: 'assets/images/kadahi.jpg',
        description: 'Strong kadahi for deep cooking.',
        price: 'Rs. 999',
      ),
      ProductItem(
        name: 'Sauce Pan',
        imagePath: 'assets/images/sauce_pan.jpg',
        description: 'Handy saucepan for tea and sauces.',
        price: 'Rs. 699',
      ),
      ProductItem(
        name: 'Tawa',
        imagePath: 'assets/images/tawa.jpg',
        description: 'Flat tawa for roti and dosa.',
        price: 'Rs. 599',
      ),
      ProductItem(
        name: 'Tiffin',
        imagePath: 'assets/images/tiffin.jpg',
        description: 'Lunch tiffin for office or school.',
        price: 'Rs. 799',
      ),
      ProductItem(
        name: 'Water Bottle',
        imagePath: 'assets/images/water_bottle.jpg',
        description: 'Reusable bottle for everyday hydration.',
        price: 'Rs. 349',
      ),
    ],
  ),
  ProductCategory(
    title: 'Medical',
    products: [
      ProductItem(
        name: 'Ashwagandha',
        imagePath: 'assets/images/ashwagandha.webp',
        description: 'Herbal supplement for wellness support.',
        price: 'Rs. 549',
      ),
      ProductItem(
        name: 'Calcium',
        imagePath: 'assets/images/calcium.webp',
        description: 'Calcium tablets for bone health.',
        price: 'Rs. 299',
      ),
      ProductItem(
        name: 'Chyawanprash',
        imagePath: 'assets/images/chyawanprash.webp',
        description: 'Classic immunity support supplement.',
        price: 'Rs. 399',
      ),
      ProductItem(
        name: 'Kadha',
        imagePath: 'assets/images/kadha.webp',
        description: 'Herbal kadha for seasonal wellness.',
        price: 'Rs. 249',
      ),
      ProductItem(
        name: 'Saffi',
        imagePath: 'assets/images/saffi.webp',
        description: 'Herbal tonic for daily wellness.',
        price: 'Rs. 189',
      ),
      ProductItem(
        name: 'Shilajit',
        imagePath: 'assets/images/shilajit.webp',
        description: 'Traditional supplement for strength.',
        price: 'Rs. 699',
      ),
      ProductItem(
        name: 'Vics Vapour',
        imagePath: 'assets/images/vics_vapour.webp',
        description: 'Vapour rub for cold comfort.',
        price: 'Rs. 159',
      ),
    ],
  ),
];

const List<ProductItem> featuredProducts = [
  ProductItem(
    name: 'Headphone',
    imagePath: 'assets/images/headphone.jpg',
    description: 'Comfort headphones with clear sound.',
    price: 'Rs. 1,499',
  ),
  ProductItem(
    name: 'Cooker',
    imagePath: 'assets/images/cooker.jpg',
    description: 'Durable pressure cooker for daily meals.',
    price: 'Rs. 1,899',
  ),
  ProductItem(
    name: 'Baby Toys',
    imagePath: 'assets/images/baby_toys.webp',
    description: 'Colorful toys for early playtime.',
    price: 'Rs. 499',
  ),
  ProductItem(
    name: 'Lip Balm',
    imagePath: 'assets/images/lipbalm.webp',
    description: 'Soft moisturizing balm for dry lips.',
    price: 'Rs. 149',
  ),
];
