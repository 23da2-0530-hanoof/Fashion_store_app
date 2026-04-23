import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/routes.dart';
import '../providers/cart_provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String selectedSize = 'M';
  
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? product =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final theme = Theme.of(context);

    // Fallback if accessed without args
    final safeProduct = product ??
        {
          'name': 'Silk Evening Dress',
          'price': 'LKR 2999.00',
          'image':
              'https://images.unsplash.com/photo-1539008835657-9e8e9680c956?w=800&q=80',
        };

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.cart);
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Product Image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  safeProduct['image'],
                  height: 450,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Details
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          safeProduct['name'],
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        safeProduct['price'],
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // Sizes Section
                  Text(
                    'SELECT SIZE',
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: ['XS', 'S', 'M', 'L', 'XL'].map((size) {
                      bool isSelected = size == selectedSize;
                      return Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: InkWell(
                          onTap: () => setState(() => selectedSize = size),
                          child: Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.black : Colors.white,
                              border: Border.all(
                                color: isSelected ? Colors.black : Colors.black12,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              size,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 32),

                  // Description
                  Text(
                    'DETAILS',
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'A defining piece from the Spring 2026 "Studio Black" collection. Exquisitely tailored with sustainable silk, this dress offers a seamless silhouette and timeless elegance for any evening occasion.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      height: 1.8,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ElevatedButton(
            onPressed: () {
              context.read<CartProvider>().addItem(safeProduct, selectedSize);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Added to Cart'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20),
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
            child: const Text(
              'Add To Cart',
              style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

}
