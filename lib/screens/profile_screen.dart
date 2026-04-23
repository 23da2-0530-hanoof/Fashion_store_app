import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/routes.dart';
import '../providers/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Profile Info
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: theme.colorScheme.primary,
                    child: Text(
                      authProvider.name.isNotEmpty
                          ? authProvider.name[0].toUpperCase()
                          : 'U',
                      style: theme.textTheme.headlineLarge?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    authProvider.name,
                    style: theme.textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    authProvider.email,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                  const SizedBox(height: 24),
                  OutlinedButton(
                    onPressed: () {
                      _showSnackBar(context, 'Edit Profile Tapped');
                    },
                    child: const Text('EDIT PROFILE'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),

            // Menu items
            _buildMenuItem(
              context,
              Icons.shopping_bag_outlined,
              'My Orders',
              () {
                Navigator.pushNamed(context, AppRoutes.orders);
              },
            ),
            _buildMenuItem(context, Icons.favorite_border, 'Wishlist', () {
              Navigator.pushNamed(context, AppRoutes.wishlist);
            }),
            _buildMenuItem(
              context,
              Icons.location_on_outlined,
              'Shipping Addresses',
              () {
                Navigator.pushNamed(context, AppRoutes.addresses);
              },
            ),
            _buildMenuItem(
              context,
              Icons.payment_outlined,
              'Payment Methods',
              () {
                Navigator.pushNamed(context, AppRoutes.payment);
              },
            ),
            _buildMenuItem(context, Icons.settings_outlined, 'Settings', () {
              Navigator.pushNamed(context, AppRoutes.settings);
            }),
            const Divider(height: 48),
            _buildMenuItem(context, Icons.logout, 'Log Out', () {
              context.read<AuthProvider>().logout();
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.login,
                (route) => false,
              );
            }, color: theme.colorScheme.error),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap, {
    Color? color,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: color ?? Theme.of(context).colorScheme.onSurface,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: color ?? Theme.of(context).colorScheme.onSurface,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, size: 20),
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
    );
  }
}
