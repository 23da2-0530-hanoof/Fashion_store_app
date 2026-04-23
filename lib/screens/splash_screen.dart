import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../core/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(gradient: AppTheme.editorialGradient),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),

              Container(
                width: 48,
                height: 1,
                color: AppTheme.onPrimary.withValues(alpha: 0.3),
                margin: const EdgeInsets.only(bottom: 48),
              ),

              Text(
                'THE DIGITAL',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppTheme.onPrimary.withValues(alpha: 0.7),
                  letterSpacing: 4.0,
                ),
              ),

              const SizedBox(height: 16),

              Text(
                'STUDIO',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontStyle: FontStyle.italic,
                  color: AppTheme.onPrimary,
                  height: 1.0,
                ),
              ),

              Text(
                'BLACK',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: AppTheme.onPrimary.withValues(alpha: 0.9),
                  height: 1.0,
                ),
              ),

              const SizedBox(height: 32),

              Text(
                'HIGH FASHION & CURATION',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppTheme.onPrimary.withValues(alpha: 0.6),
                  fontStyle: FontStyle.italic,
                  letterSpacing: 2.0,
                ),
              ),

              Container(
                width: 48,
                height: 1,
                color: AppTheme.onPrimary.withValues(alpha: 0.3),
                margin: const EdgeInsets.only(top: 48),
              ),

              const SizedBox(height: 80),

              Text(
                'ESTABLISHMENT 2026',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppTheme.onPrimary.withValues(alpha: 0.4),
                  letterSpacing: 4.0,
                ),
              ),

              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
