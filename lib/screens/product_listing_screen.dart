import 'package:flutter/material.dart';
import '../core/routes.dart';

class ProductListingScreen extends StatefulWidget {
  const ProductListingScreen({super.key});

  @override
  State<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, dynamic>> allProducts = [
    {'name': 'Silk Evening Dress', 'price': 'LKR 299.00', 'image': 'https://images.unsplash.com/photo-1539008835657-9e8e9680c956?w=400&q=80'},
    {'name': 'Velvet Blouse', 'price': 'LKR 129.00', 'image': 'https://images.unsplash.com/photo-1550639525-c97d455acf70?w=400&q=80'},
    {'name': 'Leather Handbag', 'price': 'LKR 450.00', 'image': 'https://images.unsplash.com/photo-1584916201218-f4242ceb4809?w=400&q=80'},
    {'name': 'Black Sunglasses', 'price': 'LKR 180.00', 'image': 'https://images.unsplash.com/photo-1511499767150-a48a237f0083?w=400&q=80'},
    {'name': 'Classic Trench Coat', 'price': 'LKR 399.00', 'image': 'https://images.unsplash.com/photo-1591047139829-d91aecb6caea?w=400&q=80'},
    {'name': 'Pleated Midi Skirt', 'price': 'LKR 110.00', 'image': 'https://images.unsplash.com/photo-1594633312681-425c7b97ccd1?w=800&q=80'},
  ];

  List<Map<String, dynamic>> _filteredProducts = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _filteredProducts = allProducts;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _filteredProducts = allProducts
          .where((product) => product['name'].toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search products...',
                  border: InputBorder.none,
                ),
                style: theme.textTheme.bodyLarge,
              )
            : const Text('All Products'),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                if (_isSearching) {
                  _isSearching = false;
                  _searchController.clear();
                } else {
                  _isSearching = true;
                }
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      body: _filteredProducts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search_off, size: 64, color: theme.disabledColor),
                  const SizedBox(height: 16),
                  Text('No products found', style: theme.textTheme.titleMedium),
                ],
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: _filteredProducts.length,
              itemBuilder: (context, index) {
                final product = _filteredProducts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.productDetails, arguments: product);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: NetworkImage(product['image']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product['name'],
                        style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        product['price'],
                        style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.primary),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

