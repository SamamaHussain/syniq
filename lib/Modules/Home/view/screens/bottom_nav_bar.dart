// lib/presentation/layouts/floating_navigation.dart
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:syniq/Modules/Home/view/screens/home_screen.dart';
import 'package:syniq/Modules/settings/settings_screen.dart';

class FloatingNavigation extends StatelessWidget {
  const FloatingNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: PersistentTabController(initialIndex: 0),
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineToSafeArea: true,
      backgroundColor: Colors.transparent,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(25),
        colorBehindNavBar: Colors.transparent,
      ),
      navBarStyle: NavBarStyle.style13,
      navBarHeight: 70,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
    );
  }

  List<Widget> _buildScreens() {
    return [const HomeScreen(), const SettingsPage(), const SettingsPage()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_rounded, size: 26),
        title: "Home",
        activeColorPrimary: Colors.deepPurple,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.analytics_rounded, size: 26),
        title: "Insights",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      // PersistentBottomNavBarItem(
      //   icon: Container(
      //     height: 55,
      //     width: 55,
      //     decoration: BoxDecoration(
      //       shape: BoxShape.circle,
      //       gradient: LinearGradient(
      //         colors: [Colors.purple.shade400, Colors.blue.shade400],
      //         begin: Alignment.topLeft,
      //         end: Alignment.bottomRight,
      //       ),
      //       boxShadow: [
      //         BoxShadow(
      //           color: Colors.purple.withOpacity(0.3),
      //           blurRadius: 10,
      //           offset: const Offset(0, 4),
      //         ),
      //       ],
      //     ),
      //     child: const Icon(Icons.add, color: Colors.white, size: 28),
      //   ),
      //   title: "",
      // ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings_rounded, size: 26),
        title: "Resumes",
        activeColorPrimary: Colors.orange,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }
}
