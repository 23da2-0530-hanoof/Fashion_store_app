import 'package:flutter/material.dart';
import '../core/routes.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    // Mock wishlist data
    final wishlistItems = [
      {
        'name': 'Silk Evening Dress',
        'price': 'LKR 29,900.00',
        'image': 'https://images.unsplash.com/photo-1539008835657-9e8e9680c956?w=600&q=80',
        'category': 'DRESSES',
      },
      {
        'name': 'Leather Handbag',
        'price': 'LKR 45,000.00',
        'image': 'https://images.unsplash.com/photo-1584916201218-f4242ceb4809?w=600&q=80',
        'category': 'ACCESSORIES',
      },
      {
        'name': 'Black Sunglasses',
        'price': 'LKR 18,000.00',
        'image': 'https://images.unsplash.com/photo-1511499767150-a48a237f0083?w=600&q=80',
        'category': 'ACCESSORIES',
      },
      {
        'name': 'Velvet Blouse',
        'price': 'LKR 12,900.00',
        'image': 'https://images.unsplash.com/photo-1550639525-c97d455acf70?w=600&q=80',
        'category': 'TOPS',
      },
    ];

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: Text(
          'WISHLIST',
          style: theme.textTheme.labelLarge?.copyWith(
            color: theme.colorScheme.onSurface,
            letterSpacing: 2.5,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: wishlistItems.isEmpty
          ? _buildEmptyState(context)
          : LayoutBuilder(
              builder: (context, constraints) {
                // Calculate item width based on padding (24 * 2 = 48) and crossAxisSpacing (20)
                final itemWidth = (constraints.maxWidth - 68) / 2;
                // Image ratio is 0.75. Add fixed height (~120px) for the text beneath it.
                final itemHeight = (itemWidth / 0.75) + 120;
                
                return GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: itemWidth / itemHeight,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 32,
                  ),
                  itemCount: wishlistItems.length,
                  itemBuilder: (context, index) {
                    final item = wishlistItems[index];
                    return _buildWishlistItem(context, item);
                  },
                );
              },
            ),
    );
  }

  Widget _buildWishlistItem(BuildContext context, Map<String, String> item) {
    final theme = Theme.of(context);
    
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.productDetails, arguments: item);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 0.75,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                      image: NetworkImage(item['image']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.8),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.favorite,
                    size: 16,
                    color: theme.colorScheme.error,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            item['category']!,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item['name']!,
            style: theme.textTheme.titleMedium?.copyWith(
              height: 1.2,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Text(
            item['price']!,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 64,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
          ),
          const SizedBox(height: 24),
          Text(
            'YOUR WISHLIST IS EMPTY',
            style: theme.textTheme.titleLarge?.copyWith(
              letterSpacing: 2,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.home);
            },
            child: const Text('EXPLORE COLLECTIONS'),
          ),
        ],
      ),
    );
  }
}
