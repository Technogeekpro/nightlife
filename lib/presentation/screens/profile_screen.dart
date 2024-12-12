import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:night_life/styles/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.background,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'User Name',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  //  const SizedBox(height: 8),
                  Text(
                    'user@example.com',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.secondary,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Divider(color: AppColors.primary.withOpacity(0.2)),
            const SizedBox(height: 16),
            _buildProfileOption(Iconsax.location, 'Manage Address', onTap: () {
              Navigator.pushNamed(context, '/manage_address');
            }),
            _buildProfileOption(Iconsax.calendar, 'Your Bookings'),
            _buildProfileOption(Iconsax.bookmark, 'Book Marks'),
            _buildProfileOption(Iconsax.notification, 'Notifications'),
            _buildProfileOption(Iconsax.setting, 'Settings'),
            _buildProfileOption(Iconsax.wallet, 'Payment Options'),
            _buildProfileOption(Iconsax.star, 'Rating'),
            _buildProfileOption(Iconsax.document, 'Terms & Conditions'),
            _buildProfileOption(Iconsax.message, 'Send Feedback'),
            const SizedBox(height: 16),
            Divider(color: AppColors.primary.withOpacity(0.5)),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () {
                  //Write a code to logout and go back to login page
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title, {Function()? onTap}) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      splashColor: AppColors.primary.withOpacity(0.1),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white,
            ),
      ),
      onTap: onTap,
    );
  }
}
