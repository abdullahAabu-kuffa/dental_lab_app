import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:dental_lab_app/generated/l10n.dart';
import 'package:dental_lab_app/logic/cubit/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;
    final themeState = context.watch<ThemeCubit>().isDark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Hero section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SizedBox(
            height: 300,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/caseback.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(204, 28, 28, 28),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _GradientHeading(
                            primary: S.of(context).About,
                            gradient: " ${S.of(context).Us}",
                          ),
                          SizedBox(height: 12),
                          Text(
                            S.of(context).aboutUs,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  color: Colors.black45,
                                  offset: Offset(1, 1),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Main content
        Container(
          color: themeState ? AppColors.primBgColor : AppColors.whiteColor,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionCard(
                title: S.of(context).whoweare,
                text: S.of(context).weare,
                image: Image.asset(
                  'assets/images/hero.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 240,
                ),
              ),

              SectionCard(
                title: S.of(context).uniqe,
                text: S.of(context).uniqeness,
                image: Image.asset(
                  'assets/images/c1.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 240,
                ),
              ),

              SectionCard(
                title: S.of(context).educational,
                text: S.of(context).educationaltext,
                image: Image.asset(
                  'assets/images/c3.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 240,
                ),
              ),

              SectionCard(
                title: S.of(context).community,
                text: S.of(context).communitytext,
              ),
            ],
          ),
        ),

        // Call to action
      ],
    );
  }
}

class _GradientHeading extends StatelessWidget {
  final String primary;
  final String gradient;
  const _GradientHeading({required this.primary, required this.gradient});

  @override
  Widget build(BuildContext context) {
    final gradientPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Colors.yellow, Colors.orange],
      ).createShader(const Rect.fromLTWH(0, 0, 300, 80));

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: primary,
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  color: Colors.black54,
                  offset: Offset(2, 2),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
          TextSpan(
            text: gradient,
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              foreground: gradientPaint,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}

class SectionHeading extends StatelessWidget {
  final String text;
  const SectionHeading(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>().isDark;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, top: 24),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: themeState ? AppColors.whiteColor : AppColors.goldenColor,
        ),
      ),
    );
  }
}

class SectionText extends StatelessWidget {
  final String text;
  const SectionText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>().isDark;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          height: 1.4,
          color: themeState ? AppColors.whiteColor : Color(0xFF4A4A4A),
        ),
      ),
    );
  }
}

/// Simulated "sticky" behavior: keeps child visible at the top as you scroll.
/// For true stickiness, you can move this to a SliverPersistentHeader in a wider refactor.
class _StickyImage extends StatelessWidget {
  final Widget child;
  const _StickyImage({required this.child});

  @override
  Widget build(BuildContext context) {
    // Wrap in Align to avoid expanding vertically
    return Align(alignment: Alignment.topCenter, child: child);
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final String text;
  final Widget? image;

  const SectionCard({
    super.key,
    required this.title,
    required this.text,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: AppColors.yellowColor, width: 2)),
      margin: const EdgeInsets.only(bottom: 24),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(title),
            const SizedBox(height: 12),
            SectionText(text),
            if (image != null) ...[
              const SizedBox(height: 16),
              ClipRRect(borderRadius: BorderRadius.circular(12), child: image!),
            ],
          ],
        ),
      ),
    );
  }
}
