import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_assets.dart';
import '../../core/localization/app_localizations.dart';
import '../../core/data/app_data.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contact = AppData.contactInfo;
    final l = AppLocalizations.of(context);
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Scaffold(
      backgroundColor: AppColors.surfaceDark,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 12),

              // Top bar
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.cardDark,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        isRtl
                            ? Icons.arrow_forward_ios_rounded
                            : Icons.arrow_back_ios_new_rounded,
                        color: AppColors.textPrimary,
                        size: 18,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(l.get('contactTitle'), style: AppTextStyles.headline3),
                  const Spacer(),
                  const SizedBox(width: 42),
                ],
              ).animate().fadeIn(duration: 400.ms),

              const SizedBox(height: 40),

              // Logo
              ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(AppAssets.logo, width: 100, height: 100),
                  )
                  .animate(delay: 200.ms)
                  .fadeIn(duration: 500.ms)
                  .scale(
                    begin: const Offset(0.8, 0.8),
                    end: const Offset(1.0, 1.0),
                    duration: 500.ms,
                    curve: Curves.easeOutBack,
                  ),

              const SizedBox(height: 16),

              // Company name
              Text(
                contact.companyName,
                style: AppTextStyles.headline2.copyWith(
                  color: AppColors.accent,
                ),
              ).animate(delay: 300.ms).fadeIn(duration: 400.ms),

              const SizedBox(height: 4),

              Text(
                contact.companyNameAr,
                style: AppTextStyles.subtitle.copyWith(
                  color: AppColors.textMuted,
                ),
              ).animate(delay: 350.ms).fadeIn(duration: 400.ms),

              const SizedBox(height: 8),

              Text(
                l.get('contactSubtitle'),
                style: AppTextStyles.body,
              ).animate(delay: 400.ms).fadeIn(duration: 400.ms),

              const SizedBox(height: 40),

              // Contact cards
              _buildContactCard(
                icon: Icons.phone_rounded,
                label: l.get('phoneLabel'),
                value: contact.phone,
                color: const Color(0xFF4CAF50),
                onTap: () => _launchUrl('tel:${contact.phone}'),
                index: 0,
                isRtl: isRtl,
              ),

              const SizedBox(height: 12),

              _buildContactCard(
                icon: Icons.chat_rounded,
                label: l.get('whatsappLabel'),
                value: l.isArabic ? 'تواصل معنا' : 'Chat with us',
                color: const Color(0xFF25D366),
                onTap: () => _launchUrl(
                  'https://wa.me/${contact.whatsapp.replaceAll(RegExp(r'[^0-9]'), '')}',
                ),
                index: 1,
                isRtl: isRtl,
              ),

              const SizedBox(height: 12),

              _buildContactCard(
                icon: Icons.location_on_rounded,
                label: l.get('locationLabel'),
                value: contact.address,
                color: const Color(0xFFE53935),
                onTap: () => _launchUrl(contact.googleMapsUrl),
                index: 2,
                isRtl: isRtl,
              ),

              const SizedBox(height: 40),

              // Footer
              Text(
                '© 2024 ${contact.companyName}',
                style: AppTextStyles.caption,
              ).animate(delay: 800.ms).fadeIn(duration: 400.ms),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
    required VoidCallback onTap,
    required int index,
    required bool isRtl,
  }) {
    return GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.cardDark,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: color.withValues(alpha: 0.2)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textMuted,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        value,
                        style: AppTextStyles.subtitle.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  isRtl
                      ? Icons.arrow_back_ios_rounded
                      : Icons.arrow_forward_ios_rounded,
                  color: color.withValues(alpha: 0.5),
                  size: 16,
                ),
              ],
            ),
          ),
        )
        .animate()
        .fadeIn(
          delay: Duration(milliseconds: 500 + (index * 100)),
          duration: 400.ms,
        )
        .slideX(
          begin: isRtl ? -0.2 : 0.2,
          end: 0,
          delay: Duration(milliseconds: 500 + (index * 100)),
          duration: 400.ms,
          curve: Curves.easeOutCubic,
        );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
