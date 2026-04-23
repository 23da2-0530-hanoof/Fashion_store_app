import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    // Mock orders data
    final orders = [
      {
        'id': '#SB-2026-8921',
        'date': 'Mar 14, 2026',
        'status': 'Delivered',
        'amount': 'LKR 42,500.00',
        'items': 'Silk Evening Dress, Leather Handbag',
      },
      {
        'id': '#SB-2026-7742',
        'date': 'Feb 02, 2026',
        'status': 'Shipped',
        'amount': 'LKR 12,900.00',
        'items': 'Velvet Blouse',
      },
      {
        'id': '#SB-2026-6109',
        'date': 'Jan 25, 2026',
        'status': 'Processing',
        'amount': 'LKR 18,000.00',
        'items': 'Black Sunglasses',
      },
    ];

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: Text(
          'MY ORDERS',
          style: theme.textTheme.labelLarge?.copyWith(
            color: theme.colorScheme.onSurface,
            letterSpacing: 2,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          // Tonal layering: Alternate backgrounds slightly instead of using dividers
          final bool isEven = index % 2 == 0;
          final Color cardColor = isEven 
              ? theme.colorScheme.surface 
              : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3);

          return Container(
            margin: const EdgeInsets.only(bottom: 24),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      order['id']!,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontSize: 20,
                        letterSpacing: -0.5,
                      ),
                    ),
                    _buildStatusBadge(context, order['status']!),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  order['items']!,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'PLACED ON',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(order['date']!, style: theme.textTheme.bodyMedium),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'TOTAL AMOUNT',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          order['amount']!,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      // Action details
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: BorderSide(
                        color: theme.colorScheme.primary.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Text(
                      'VIEW DETAILS',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.primary,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context, String status) {
    final theme = Theme.of(context);
    Color color;
    switch (status.toLowerCase()) {
      case 'delivered':
        color = const Color(0xFF00322A);
        break;
      case 'shipped':
        color = const Color(0xFF735C00);
        break;
      default:
        color = Colors.black54;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        status.toUpperCase(),
        style: theme.textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}
