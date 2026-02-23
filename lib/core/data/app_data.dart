import 'package:flutter/material.dart';
import '../constants/app_assets.dart';
import '../models/service_category.dart';
import '../models/contact_info.dart';
import '../theme/app_colors.dart';

class AppData {
  AppData._();

  static const List<ServiceCategory> categories = [
    ServiceCategory(
      id: 'fencing',
      titleKey: 'fencingTitle',
      descriptionKey: 'fencingDescription',
      iconData: Icons.fence,
      coverImage: AppAssets.fencingCover,
      images: [
        AppAssets.fencing1,
        AppAssets.fencing2,
        AppAssets.fencing1,
        AppAssets.fencing2,
      ],
      color: AppColors.fencingColor,
    ),
    ServiceCategory(
      id: 'events',
      titleKey: 'eventsTitle',
      descriptionKey: 'eventsDescription',
      iconData: Icons.event,
      coverImage: AppAssets.eventsCover,
      images: [
        AppAssets.events1,
        AppAssets.events2,
        AppAssets.events1,
        AppAssets.events2,
      ],
      color: AppColors.eventsColor,
    ),
    ServiceCategory(
      id: 'printing',
      titleKey: 'printingTitle',
      descriptionKey: 'printingDescription',
      iconData: Icons.print,
      coverImage: AppAssets.printingCover,
      images: [
        AppAssets.printing1,
        AppAssets.printing2,
        AppAssets.printing1,
        AppAssets.printing2,
      ],
      color: AppColors.printingColor,
    ),
  ];

  static const ContactInfo contactInfo = ContactInfo(
    companyName: 'Color It',
    companyNameAr: 'لونها Ci',
    phone: '+966 50 000 0000',
    whatsapp: '+966500000000',
    address: 'Riyadh, Saudi Arabia',
    googleMapsUrl: 'https://maps.google.com/?q=Riyadh+Saudi+Arabia',
  );
}
