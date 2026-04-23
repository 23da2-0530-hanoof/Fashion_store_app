import 'package:flutter/material.dart';
import '../core/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _selectedCategoryIndex = 0;

  final List<String> categories = [
    'All',
    'Dresses',
    'Tops',
    'Accessories',
    'Shoes',
  ];

  final List<Map<String, dynamic>> featuredProducts = [
    {
      'name': 'Silk Evening Dress',
      'price': 'LKR 2999.00',
      'image': 'https://images.unsplash.com/photo-1539008835657-9e8e9680c956?w=800&q=80',
      'category': 'DRESSES',
    },
    {
      'name': 'Velvet Blouse',
      'price': 'LKR 1297.00',
      'image': 'https://images.unsplash.com/photo-1550639525-c97d455acf70?w=800&q=80',
      'category': 'TOPS',
    },
    {
      'name': 'Leather Handbag',
      'price': 'LKR 4500.00',
      'image': 'https://images.unsplash.com/photo-1584916201218-f4242ceb4809?w=800&q=80',
      'category': 'ACCESSORIES',
    },
    {
      'name': 'Black Sunglasses',
      'price': 'LKR 1800.00',
      'image': 'https://images.unsplash.com/photo-1511499767150-a48a237f0083?w=800&q=80',
      'category': 'ACCESSORIES',
    },
  ];

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.pushNamed(context, AppRoutes.cart);
    } else if (index == 2) {
      Navigator.pushNamed(context, AppRoutes.profile);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'STUDIO BLACK',
          style: theme.textTheme.titleLarge?.copyWith(
            letterSpacing: 4,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.productListing),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            // Banner Section
            _buildBanner(context),

            const SizedBox(height: 32),

            // Categories
            _buildCategoriesSection(context),

            const SizedBox(height: 32),

            // Featured Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Featured',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, AppRoutes.productListing),
                    child: Text(
                      'See All',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Featured Grid
            _buildFeaturedGrid(context),

            const SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildBanner(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary, // #00322A
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'NEW COLLECTION',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: Colors.white70,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Spring\n2026',
                    style: theme.textTheme.displayMedium?.copyWith(
                      color: Colors.white,
                      height: 1.1,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.productListing),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              child: const Text('SHOP\nNOW', textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesSection(BuildContext context) {
    final theme = Theme.of(context);
    const accentTeal = Color(0xFF00E5BC);

    return SizedBox(
      height: 48,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = index == _selectedCategoryIndex;
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: FilterChip(
              label: Text(categories[index]),
              selected: isSelected,
              showCheckmark: isSelected,
              onSelected: (val) =>
                  setState(() => _selectedCategoryIndex = index),
              selectedColor: accentTeal,
              checkmarkColor: Colors.black,
              labelStyle: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: BorderSide(
                  color: isSelected ? accentTeal : Colors.black12,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeaturedGrid(BuildContext context) {
    final theme = Theme.of(context);
    final selectedCategory = categories[_selectedCategoryIndex].toUpperCase();
    
    final filteredProducts = selectedCategory == 'ALL'
        ? featuredProducts
        : featuredProducts.where((p) => p['category'] == selectedCategory).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: filteredProducts.isEmpty 
        ? Container(
            height: 200,
            alignment: Alignment.center,
            child: Text('No products found in this category.', style: theme.textTheme.bodyMedium),
          )
        : GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 16,
              mainAxisSpacing: 24,
            ),
            itemCount: filteredProducts.length,
            itemBuilder: (context, index) {
              final product = filteredProducts[index];
              return GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  AppRoutes.productDetails,
                  arguments: product,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: NetworkImage(product['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      product['name'],
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product['price'],
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
    );
  }

}
