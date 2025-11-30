import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:dental_lab_app/generated/l10n.dart';
import 'package:dental_lab_app/logic/cubit/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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


class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Service> services = [
      Service(
        id: 1,
        title: S.of(context).crowbnridge,
        description: S.of(context).highprecision,
        icon: Icons.account_balance,
      ),
      Service(
        id: 2,
        title: S.of(context).implants,
        description: S.of(context).digitalimplants,
        icon: Icons.medical_services,
      ),
      Service(
        id: 3,
        title: S.of(context).veneers,
        description: S.of(context).premiumveneers,
        icon: Icons.masks,
      ),
      Service(
        id: 4,
        title: S.of(context).orthodontics,
        description: S.of(context).clearaligners,
        icon: Icons.align_vertical_center,
      ),
    ];
    final themeState=context.watch<ThemeCubit>().isDark;
    return Container(
      color:themeState? AppColors.primBgColor : AppColors.whiteColor,
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
                style: TextStyle(fontSize: 18, color: themeState? AppColors.whiteColor : AppColors.blackColor),
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
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>().isDark;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.identity()..scale(_hovering ? 1.04 : 1.0),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: themeState
              ? LinearGradient(colors: [AppColors.darkGreyColor, AppColors.primBgColor],
                  begin: Alignment.topLeft, end: Alignment.bottomRight)
              : LinearGradient(colors: [Colors.white, Color(0xffF7F3E9)]),
          borderRadius: BorderRadius.circular(18),
          boxShadow: _hovering
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 20,
                    spreadRadius: 1,
                    offset: Offset(0, 10),
                  ),
                ]
              : [],
          border: Border.all(color: Color(0xffD4AF37), width: 1.8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon inside golden circle
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xffE6C770), Color(0xffD4AF37)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Icon(
                widget.service.icon,
                size: 36,
                color: themeState ? Colors.black : Colors.white,
              ),
            ),

            SizedBox(height: 18),

            Text(
              widget.service.title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: themeState ? Colors.white : Color(0xff4B3F24),
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 6),

            Text(
              widget.service.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                height: 1.4,
                color: themeState ? Colors.white70 : Color(0xff4A4A4A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
