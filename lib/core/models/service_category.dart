import 'package:flutter/material.dart';

class ServiceCategory {
  final String id;
  final String titleKey;
  final String descriptionKey;
  final IconData iconData;
  final String coverImage;
  final List<String> images;
  final Color color;

  const ServiceCategory({
    required this.id,
    required this.titleKey,
    required this.descriptionKey,
    required this.iconData,
    required this.coverImage,
    required this.images,
    required this.color,
  });
}
