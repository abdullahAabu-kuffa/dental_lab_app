import 'package:dental_lab_app/presentation/screens/home/aboutUs/about_us.dart';
import 'package:dental_lab_app/presentation/screens/home/services/services.dart';
import 'package:dental_lab_app/presentation/screens/home/widgets/home_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 20.0,
                ),
                child: const HomeHeader(),
              ),
            ),
            SliverToBoxAdapter(child: const SizedBox(height: 20)),
            SliverToBoxAdapter(
              child: const Services(),
            ), // ✅ Services is plain widget
            SliverToBoxAdapter(
              child: const AboutUs(),
            ), // ✅ AboutUs is plain widget
          ],
        ),
      ),
    );
  }
}
