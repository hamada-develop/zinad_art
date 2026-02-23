import 'package:flutter/material.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/section/section_screen.dart';
import '../../features/section/image_preview_screen.dart';
import '../../features/contact/contact_screen.dart';
import '../models/service_category.dart';

class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String home = '/home';
  static const String section = '/section';
  static const String imagePreview = '/image-preview';
  static const String contact = '/contact';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _fadeRoute(const SplashScreen(), settings);

      case home:
        return _slideRoute(const HomeScreen(), settings);

      case section:
        final category = settings.arguments as ServiceCategory;
        return _slideRoute(SectionScreen(category: category), settings);

      case imagePreview:
        final args = settings.arguments as Map<String, dynamic>;
        return _fadeRoute(
          ImagePreviewScreen(
            imagePath: args['imagePath'] as String,
            heroTag: args['heroTag'] as String,
          ),
          settings,
        );

      case contact:
        return _slideRoute(const ContactScreen(), settings);

      default:
        return _fadeRoute(const SplashScreen(), settings);
    }
  }

  static PageRouteBuilder _fadeRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 400),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  static PageRouteBuilder _slideRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 400),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: Curves.easeInOutCubic));
        return SlideTransition(
          position: animation.drive(tween),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
    );
  }
}
