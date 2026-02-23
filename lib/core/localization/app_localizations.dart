import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  bool get isArabic => locale.languageCode == 'ar';

  String get(String key) {
    final map = isArabic ? _arStrings : _enStrings;
    return map[key] ?? _enStrings[key] ?? key;
  }

  // ─── English ───
  static const Map<String, String> _enStrings = {
    // App
    'appName': 'Color It',
    'appNameAr': 'لونها Ci',
    'appTagline': 'Creativity That Speaks',

    // Home
    'welcomeTitle': 'Welcome to Color It',
    'welcomeSubtitle':
        'Your trusted partner in advertising, events, and printing services',
    'ourServices': 'Our Services',

    // Fencing
    'fencingTitle': 'Project Advertising Fencing',
    'fencingDescription':
        'We specialize in construction site fencing with branded project perimeter panels. '
        'Our advertising fencing solutions transform ordinary construction barriers into powerful '
        'marketing displays that promote your brand and project vision to thousands of passersby daily.',

    // Events
    'eventsTitle': 'Events & Exhibitions',
    'eventsDescription':
        'From exhibition booth setups to full-scale corporate event organization, we deliver '
        'memorable experiences. Our team handles stage design, branding setups, lighting installations, '
        'and display arrangements that leave lasting impressions on your audience.',

    // Printing
    'printingTitle': 'Printing & Corporate Gifts',
    'printingDescription':
        'Premium printing services including large format printing, roll-up banners, stickers, '
        'business cards, and branded corporate gifts. We deliver high-quality print solutions '
        'that elevate your brand identity with precision and professionalism.',

    // Contact
    'contactTitle': 'Contact Us',
    'contactSubtitle': 'Get in touch with our team',
    'phoneLabel': 'Phone',
    'whatsappLabel': 'WhatsApp',
    'locationLabel': 'Location',
    'addressLabel': 'Office Address',

    // Section
    'projectGallery': 'Project Gallery',
    'viewAll': 'View All',

    // Language
    'switchLanguage': 'العربية',
  };

  // ─── Arabic ───
  static const Map<String, String> _arStrings = {
    // App
    'appName': 'لونها Ci',
    'appNameAr': 'Color It',
    'appTagline': 'إبداع يتحدث',

    // Home
    'welcomeTitle': 'مرحباً بكم في لونها',
    'welcomeSubtitle': 'شريكك الموثوق في خدمات الإعلان والفعاليات والطباعة',
    'ourServices': 'خدماتنا',

    // Fencing
    'fencingTitle': 'سياجات المشاريع الإعلانية',
    'fencingDescription':
        'نتخصص في سياجات مواقع البناء مع لوحات محيطية تحمل العلامة التجارية للمشروع. '
        'حلول السياجات الإعلانية لدينا تحول حواجز البناء العادية إلى عروض تسويقية قوية '
        'تروج لعلامتك التجارية ورؤية مشروعك لآلاف المارة يومياً.',

    // Events
    'eventsTitle': 'الفعاليات والمعارض',
    'eventsDescription':
        'من تجهيز أجنحة المعارض إلى تنظيم الفعاليات المؤسسية الكاملة، نقدم '
        'تجارب لا تُنسى. فريقنا يتولى تصميم المسرح وإعدادات العلامة التجارية وتركيبات الإضاءة '
        'وترتيبات العرض التي تترك انطباعات دائمة على جمهورك.',

    // Printing
    'printingTitle': 'الطباعة والهدايا الدعائية',
    'printingDescription':
        'خدمات طباعة متميزة تشمل الطباعة بالحجم الكبير واللفافات والبانرات والملصقات '
        'وبطاقات الأعمال والهدايا الدعائية ذات العلامة التجارية. نقدم حلول طباعة عالية الجودة '
        'ترتقي بهوية علامتك التجارية بدقة واحترافية.',

    // Contact
    'contactTitle': 'تواصل معنا',
    'contactSubtitle': 'تواصل مع فريقنا',
    'phoneLabel': 'الهاتف',
    'whatsappLabel': 'واتساب',
    'locationLabel': 'الموقع',
    'addressLabel': 'عنوان المكتب',

    // Section
    'projectGallery': 'معرض المشاريع',
    'viewAll': 'عرض الكل',

    // Language
    'switchLanguage': 'English',
  };
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async =>
      AppLocalizations(locale);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
