import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../core/routes.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final String _selectedPaymentMethod = 'Visa ending in 4242';
  final String _selectedAddress = 'No. 45, Flower Road, Colombo 07';


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final cartProvider = context.watch<CartProvider>();

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: const Text('CHECKOUT'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shipping Address Section
            _buildSectionHeader(context, 'SHIPPING ADDRESS', onEdit: () {
              Navigator.pushNamed(context, AppRoutes.addresses);
            }),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.location_on_outlined, color: Colors.black54),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      _selectedAddress,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Payment Method Section
            _buildSectionHeader(context, 'PAYMENT METHOD', onEdit: () {
              Navigator.pushNamed(context, AppRoutes.payment);
            }),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.credit_card, color: Colors.black54),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      _selectedPaymentMethod,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  const Icon(Icons.check_circle, color: Color(0xFF00322A)),
                ],
              ),
            ),

            const SizedBox(height: 48),

            // Order Summary
            Text(
              'ORDER SUMMARY',
              style: theme.textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 24),
            _buildSummaryRow('Subtotal', 'LKR ${cartProvider.totalPrice.toStringAsFixed(2)}'),
            _buildSummaryRow('Shipping', 'Free'),
            const Divider(height: 48),
            _buildSummaryRow(
              'Total',
              'LKR ${cartProvider.totalPrice.toStringAsFixed(2)}',
              isBold: true,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ElevatedButton(
            onPressed: () {
              cartProvider.clearCart();
              _showSuccessDialog(context);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20),
            ),
            child: const Text('PLACE ORDER'),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, {required VoidCallback onEdit}) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: theme.textTheme.labelSmall?.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        TextButton(
          onPressed: onEdit,
          child: const Text('Change', style: TextStyle(color: Colors.black54, decoration: TextDecoration.underline)),
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: isBold ? 18 : 16,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: isBold ? 18 : 16,
              color: isBold ? const Color(0xFF00322A) : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 24),
              const Icon(Icons.check_circle_outline, size: 80, color: Color(0xFF00E5BC)),
              const SizedBox(height: 24),
              Text(
                'ORDER PLACED!',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Your items will be shipped shortly.\nThank you for shopping with us.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(ctx).pop(); // close dialog
                    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (route) => false);
                  },
                  child: const Text('BACK TO HOME'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
