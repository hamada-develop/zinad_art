import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/localization/app_localizations.dart';
import '../../core/models/service_category.dart';
import '../../core/routing/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/gallery_grid.dart';
import '../../core/widgets/section_header.dart';

class SectionScreen extends StatelessWidget {
  final ServiceCategory category;

  const SectionScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Scaffold(
      backgroundColor: AppColors.surfaceDark,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Collapsing header
          SliverToBoxAdapter(
            child: Stack(
              children: [
                SectionHeader(
                  title: l.get(category.titleKey),
                  coverImage: category.coverImage,
                  color: category.color,
                ),
                // Back button (directional)
                PositionedDirectional(
                  top: MediaQuery.of(context).padding.top + 8,
                  start: 12,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.3),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isRtl
                            ? Icons.arrow_forward_ios_rounded
                            : Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Description
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              child:
                  Text(
                        l.get(category.descriptionKey),
                        style: AppTextStyles.body.copyWith(height: 1.8),
                      )
                      .animate()
                      .fadeIn(delay: 200.ms, duration: 500.ms)
                      .slideY(begin: 0.1, end: 0, duration: 500.ms),
            ),
          ),

          // Gallery title
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
              child: Row(
                children: [
                  Container(
                    width: 4,
                    height: 20,
                    decoration: BoxDecoration(
                      color: category.color,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    l.get('projectGallery'),
                    style: AppTextStyles.headline3.copyWith(
                      color: category.color,
                    ),
                  ),
                ],
              ).animate(delay: 300.ms).fadeIn(duration: 400.ms),
            ),
          ),

          // Image gallery
          SliverToBoxAdapter(
            child: GalleryGrid(
              images: category.images,
              heroTagPrefix: category.id,
              onImageTap: (imagePath, heroTag) {
                Navigator.pushNamed(
                  context,
                  AppRoutes.imagePreview,
                  arguments: {'imagePath': imagePath, 'heroTag': heroTag},
                );
              },
            ),
          ),

          // Bottom spacing
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }
}
