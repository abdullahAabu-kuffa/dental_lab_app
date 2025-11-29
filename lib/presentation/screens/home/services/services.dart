import 'package:dental_lab_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class Service {
  final int id;
  final String title;
  final String description;
  final IconData icon;

  Service({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
  });
}

/// Example data (replace with your actual SERVICES data)
final List<Service> services = [
  Service(
    id: 1,
    title: "Crown & Bridge",
    description: "High precision crowns and bridges crafted digitally.",
    icon: Icons.account_balance,
  ),
  Service(
    id: 2,
    title: "Implants",
    description: "Digital implant planning with ExoCAD integration.",
    icon: Icons.medical_services,
  ),
  Service(
    id: 3,
    title: "Veneers",
    description: "Premium veneers with natural aesthetics.",
    icon: Icons.masks,
  ),
  Service(
    id: 4,
    title: "Orthodontics",
    description: "Clear aligners and orthodontic solutions.",
    icon: Icons.align_vertical_center,
  ),
];

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F5F5),
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      child: Column(
        children: [
          /// Section Header
          Column(
            children:  [
              GradientHeading(text: S.of(context).ourServices),
              SizedBox(height: 8),
              Text(
                S.of(context).ourTeam,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
            ],
          ),
          const SizedBox(height: 40),

          /// Services Grid
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 1;
              if (constraints.maxWidth > 1200) {
                crossAxisCount = 4;
              } else if (constraints.maxWidth > 800) {
                crossAxisCount = 2;
              }
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];
                  return ServiceCard(service: service);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

/// Gradient Heading widget
class GradientHeading extends StatelessWidget {
  final String text;
  const GradientHeading({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final gradientPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFE4B441), Color(0xFFD4AF37)],
      ).createShader(const Rect.fromLTWH(0, 0, 200, 70));

    return Text(
      text,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        foreground: gradientPaint,
      ),
      textAlign: TextAlign.center,
    );
  }
}

/// Service Card widget
class ServiceCard extends StatefulWidget {
  final Service service;
  const ServiceCard({super.key, required this.service});

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  final bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE8E8E8),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFD4AF37), width: 2),
        boxShadow: _hovering
            ? [
                const BoxShadow(
                  color: Colors.black26,
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ]
            : [],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(widget.service.icon, size: 48, color: const Color(0xFFD4AF37)),
          const SizedBox(height: 8),
          Text(
            widget.service.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.service.description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, color: Color(0xFF4A4A4A)),
          ),
        ],
      ),
    );
  }
}
