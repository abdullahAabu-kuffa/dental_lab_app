import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Hero section
        SizedBox(
          height: 300,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/caseback.jpg',
                  fit: BoxFit.cover,
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
                      children: const [
                        _GradientHeading(primary: "About", gradient: " Us"),
                        SizedBox(height: 12),
                        Text(
                          "Egypt's first fully digital dental laboratory, revolutionizing dental restorations with advanced ExoCAD integration, real-time tracking, and seamless online services.",
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

        // Main content
        Container(
          color: const Color(0xFFF5F5F5),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SectionHeading("Who We Are"),
                    SectionText(
                      "We are Egypt's first fully digital dental laboratory, combining expert craftsmanship with cutting-edge digital technologies...",
                    ),
                    SectionHeading("What Makes Us Unique"),
                    SectionText(
                      "Our digital workflow allows you to easily choose services and materials and track every stage of your case online...",
                    ),
                    SectionHeading("Educational Resources"),
                    SectionText(
                      "We provide comprehensive guides, workshops, and tutorials on ExoCAD best practices...",
                    ),
                    _StickyImage(child: SectionHeading("Join Our Community")),
                     SectionText(
                      "Partner with us and experience seamless digital dentistry — where technology, craftsmanship, and professional support come together.",
                    ),
                  ],
                ),
              ),

              SizedBox(width: isWide ? 24 : 0),

              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(top: isWide ? 0 : 24),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/aboutUspic.jpg',
                      fit: BoxFit.cover,
                      width: isWide ? 500 : double.infinity,
                      height: isWide ? 400 : 240,
                    ),
                  ),
                ),
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
          const TextSpan(
            text: "About",
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
            text: " Us",
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, top: 24),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.black,
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          height: 1.4,
          color: Color(0xFF4A4A4A),
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
