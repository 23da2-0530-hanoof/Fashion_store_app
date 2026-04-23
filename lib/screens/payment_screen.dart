import 'package:flutter/material.dart';
import '../core/routes.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    // Mock payment methods
    final paymentMethods = [
      {'type': 'Visa', 'last4': '4242', 'expiry': '12/26', 'isDefault': true},
      {'type': 'MasterCard', 'last4': '8888', 'expiry': '05/25', 'isDefault': false},
    ];

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: const Text('PAYMENT METHODS'),
        elevation: 0,
      ),
      body: paymentMethods.isEmpty 
          ? Center(
              child: Text('No payment methods saved.', style: theme.textTheme.bodyLarge),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(24),
              itemCount: paymentMethods.length,
              itemBuilder: (context, index) {
                final method = paymentMethods[index];
                return _buildPaymentCard(context, method);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, AppRoutes.addPayment),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildPaymentCard(BuildContext context, Map<String, dynamic> method) {
    final theme = Theme.of(context);
    final isDefault = method['isDefault'] as bool;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDefault ? theme.colorScheme.primary : theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.primary.withValues(alpha: 0.1),
        ),
      ),
      child: Row(
        children: [
          Icon(
            method['type'] == 'Visa' ? Icons.credit_card : Icons.credit_card_outlined,
            color: isDefault ? Colors.white : theme.colorScheme.primary,
            size: 32,
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '**** **** **** ${method['last4']}',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: isDefault ? Colors.white : theme.colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Expires ${method['expiry']}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: isDefault ? Colors.white70 : theme.colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                ),
              ],
            ),
          ),
          if (isDefault)
            const Icon(Icons.check_circle, color: Colors.white, size: 20),
        ],
      ),
    );
  }
}

