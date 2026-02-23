import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class GalleryGrid extends StatelessWidget {
  final List<String> images;
  final String heroTagPrefix;
  final void Function(String imagePath, String heroTag) onImageTap;

  const GalleryGrid({
    super.key,
    required this.images,
    required this.heroTagPrefix,
    required this.onImageTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.0,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        final heroTag = '${heroTagPrefix}_$index';
        return GestureDetector(
              onTap: () => onImageTap(images[index], heroTag),
              child: Hero(
                tag: heroTag,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(images[index], fit: BoxFit.cover),
                  ),
                ),
              ),
            )
            .animate()
            .fadeIn(
              delay: Duration(milliseconds: 100 + (index * 80)),
              duration: 400.ms,
            )
            .scale(
              begin: const Offset(0.8, 0.8),
              end: const Offset(1.0, 1.0),
              delay: Duration(milliseconds: 100 + (index * 80)),
              duration: 400.ms,
              curve: Curves.easeOutBack,
            );
      },
    );
  }
}
