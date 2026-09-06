import 'package:ecomerce/models/product_data.dart';
import 'package:ecomerce/widgets/product_card.dart';
import 'package:flutter/material.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({
    required this.category,
    super.key,
  });

  final ProductCategory category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(14),
        itemCount: category.products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 18,
          crossAxisSpacing: 14,
          childAspectRatio: 0.66,
        ),
        itemBuilder: (context, index) {
          return ProductCard(
            product: category.products[index],
            width: double.infinity,
          );
        },
      ),
    );
  }
}
