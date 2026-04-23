import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';
import '../screens/login_screen.dart';
import '../screens/registration_screen.dart';
import '../screens/home_screen.dart';
import '../screens/product_listing_screen.dart';
import '../screens/product_details_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/orders_screen.dart';
import '../screens/wishlist_screen.dart';
import '../screens/addresses_screen.dart';
import '../screens/payment_screen.dart';
import '../screens/settings_screen.dart';

import '../screens/add_address_screen.dart';
import '../screens/add_payment_screen.dart';

import '../screens/checkout_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String registration = '/registration';
  static const String home = '/home';
  static const String productListing = '/products';
  static const String productDetails = '/product-details';
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String profile = '/profile';
  static const String orders = '/orders';
  static const String wishlist = '/wishlist';
  static const String addresses = '/addresses';
  static const String payment = '/payment';
  static const String settings = '/settings';
  static const String addAddress = '/add-address';
  static const String addPayment = '/add-payment';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => const SplashScreen(),
      login: (context) => const LoginScreen(),
      registration: (context) => const RegistrationScreen(),
      home: (context) => const HomeScreen(),
      productListing: (context) => const ProductListingScreen(),
      productDetails: (context) => const ProductDetailsScreen(),
      cart: (context) => const CartScreen(),
      checkout: (context) => const CheckoutScreen(),
      profile: (context) => const ProfileScreen(),
      orders: (context) => const OrdersScreen(),
      wishlist: (context) => const WishlistScreen(),
      addresses: (context) => const AddressesScreen(),
      payment: (context) => const PaymentScreen(),
      settings: (context) => const SettingsScreen(),
      addAddress: (context) => const AddAddressScreen(),
      addPayment: (context) => const AddPaymentScreen(),
    };
  }
}


