import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_assets.dart';
import '../../core/localization/app_localizations.dart';
import '../../core/localization/locale_cubit.dart';
import '../../core/routing/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/category_card.dart';
import 'cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..loadCategories(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Scaffold(
      backgroundColor: AppColors.surfaceDark,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Logo row
                    Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.asset(
                                AppAssets.logo,
                                width: 52,
                                height: 52,
                              ),
                            ),
                            const SizedBox(width: 14),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  l.get('appName'),
                                  style: AppTextStyles.headline3.copyWith(
                                    color: AppColors.accent,
                                  ),
                                ),
                                Text(
                                  l.get('appNameAr'),
                                  style: AppTextStyles.caption.copyWith(
                                    color: AppColors.textMuted,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            // Language toggle button
                            _buildLanguageButton(context, l),
                            const SizedBox(width: 8),
                            // Contact button
                            _buildContactButton(context),
                          ],
                        )
                        .animate()
                        .fadeIn(duration: 500.ms)
                        .slideY(begin: -0.2, end: 0, duration: 500.ms),

                    const SizedBox(height: 32),

                    // Welcome text
                    Text(l.get('welcomeTitle'), style: AppTextStyles.headline1)
                        .animate(delay: 200.ms)
                        .fadeIn(duration: 500.ms)
                        .slideX(
                          begin: isRtl ? 0.1 : -0.1,
                          end: 0,
                          duration: 500.ms,
                        ),

                    const SizedBox(height: 8),

                    Text(
                      l.get('welcomeSubtitle'),
                      style: AppTextStyles.body,
                    ).animate(delay: 300.ms).fadeIn(duration: 500.ms),

                    const SizedBox(height: 32),

                    // Section title
                    Row(
                      children: [
                        Container(
                          width: 4,
                          height: 20,
                          decoration: BoxDecoration(
                            color: AppColors.accent,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          l.get('ourServices'),
                          style: AppTextStyles.headline3.copyWith(
                            color: AppColors.accent,
                          ),
                        ),
                      ],
                    ).animate(delay: 400.ms).fadeIn(duration: 400.ms),
                  ],
                ),
              ),
            ),

            // Category cards
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoaded) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final category = state.categories[index];
                      return CategoryCard(
                        category: category,
                        index: index,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.section,
                            arguments: category,
                          );
                        },
                      );
                    }, childCount: state.categories.length),
                  );
                }
                return const SliverToBoxAdapter(child: SizedBox.shrink());
              },
            ),

            // Bottom spacing
            const SliverToBoxAdapter(child: SizedBox(height: 32)),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageButton(BuildContext context, AppLocalizations l) {
    return GestureDetector(
      onTap: () => context.read<LocaleCubit>().toggleLocale(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.accent.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.accent.withValues(alpha: 0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.language, color: AppColors.accent, size: 16),
            const SizedBox(width: 6),
            Text(
              l.get('switchLanguage'),
              style: AppTextStyles.caption.copyWith(
                color: AppColors.accent,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoutes.contact),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.accent.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.accent.withValues(alpha: 0.3)),
        ),
        child: const Icon(
          Icons.contact_phone_rounded,
          color: AppColors.accent,
          size: 22,
        ),
      ),
    );
  }
}
