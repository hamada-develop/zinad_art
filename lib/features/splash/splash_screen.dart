import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_assets.dart';
import '../../core/localization/app_localizations.dart';
import '../../core/routing/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    if (mounted) {
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.surfaceDark,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.2,
            colors: [AppColors.primaryDark, AppColors.surfaceDark],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(AppAssets.logo, width: 160, height: 160),
                )
                .animate()
                .fadeIn(duration: 800.ms, curve: Curves.easeOut)
                .scale(
                  begin: const Offset(0.5, 0.5),
                  end: const Offset(1.0, 1.0),
                  duration: 800.ms,
                  curve: Curves.easeOutBack,
                ),

            const SizedBox(height: 32),

            // Company name
            Text(
                  l.get('appName').toUpperCase(),
                  style: AppTextStyles.headline1.copyWith(
                    color: AppColors.accent,
                    letterSpacing: 6,
                    fontSize: 36,
                  ),
                )
                .animate(delay: 400.ms)
                .fadeIn(duration: 600.ms)
                .slideY(begin: 0.3, end: 0, duration: 600.ms),

            const SizedBox(height: 8),

            // Arabic name
            Text(
              l.get('appNameAr'),
              style: AppTextStyles.subtitle.copyWith(
                color: AppColors.accentLight.withValues(alpha: 0.7),
                fontSize: 18,
                letterSpacing: 2,
              ),
            ).animate(delay: 600.ms).fadeIn(duration: 600.ms),

            const SizedBox(height: 16),

            // Tagline
            Text(
              l.get('appTagline'),
              style: AppTextStyles.body.copyWith(
                color: AppColors.textMuted,
                letterSpacing: 1,
              ),
            ).animate(delay: 800.ms).fadeIn(duration: 600.ms),

            const SizedBox(height: 60),

            // Loading indicator
            SizedBox(
              width: 40,
              child: LinearProgressIndicator(
                backgroundColor: AppColors.divider,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.accent,
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ).animate(delay: 1000.ms).fadeIn(duration: 400.ms),
          ],
        ),
      ),
    );
  }
}
