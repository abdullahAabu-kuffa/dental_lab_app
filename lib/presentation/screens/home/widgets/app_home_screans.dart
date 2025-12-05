import 'package:dental_lab_app/presentation/screens/home/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:dental_lab_app/presentation/screens/home/widgets/home_nav_bar.dart';
import 'package:dental_lab_app/presentation/screens/home/home_screen.dart';
import 'package:dental_lab_app/presentation/screens/home/orders/orders_screen.dart';
import 'package:dental_lab_app/presentation/screens/home/profile/profile_screen.dart';

class AppHomeScreans extends StatefulWidget {
  const AppHomeScreans({super.key});

  @override
  State<AppHomeScreans> createState() => _AppHomeScreansState();
}

class _AppHomeScreansState extends State<AppHomeScreans> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    OrdersScreen(),
    ProfileScreen(),
  ];

  void onNavBarTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: ChatBubble(),
      bottomNavigationBar: HomeNavBar(
        currentIndexScreen: currentIndex,
        onTap: onNavBarTap,
      ),
      body: IndexedSemantics(index: currentIndex, child: screens[currentIndex]),
    );
  }
}
