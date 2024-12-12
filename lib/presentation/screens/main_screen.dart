import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:night_life/presentation/screens/favourite_screen.dart';
import 'package:night_life/presentation/screens/home/home_screen.dart';
import 'package:night_life/presentation/screens/profile_screen.dart';
import 'package:night_life/presentation/screens/venue_screen.dart';
import 'package:night_life/styles/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    VenueScreen(), // Replace with actual screen
    FavouriteScreen(), // Replace with actual screen
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: _buildCustomNavigationBar(),
    );
  }

  Widget _buildCustomNavigationBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Iconsax.home, 'Home', 0),
          _buildNavItem(Iconsax.search_normal, 'Search', 1),
          _buildNavItem(Iconsax.heart, 'Favorites', 2),
          _buildNavItem(Iconsax.user, 'Profile', 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              if (isSelected)
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [AppColors.primary, AppColors.accent],
                    ),
                  ),
                ),
              Icon(
                icon,
                color: isSelected ? Colors.white : Colors.grey,
              ),
            ],
          ),
          if (!isSelected)
            Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
        ],
      ),
    );
  }
}
