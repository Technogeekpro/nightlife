import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:night_life/presentation/screens/admin/admin_screen.dart';
import 'package:night_life/presentation/screens/main_screen.dart';
import 'package:night_life/presentation/screens/auth/login_screen.dart';
import 'package:night_life/presentation/screens/organiser_screens/organiser_main_screen.dart';
import 'package:night_life/styles/colors.dart';

class GatewayScreen extends StatefulWidget {
  const GatewayScreen({super.key});

  @override
  State<GatewayScreen> createState() => _GatewayScreenState();
}

class _GatewayScreenState extends State<GatewayScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _checkUserRole);
  }

  Future<void> _checkUserRole() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // User is not logged in, redirect to login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
      return;
    }

    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        String role = userDoc['userType'];
        if (role == 'admin') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const AdminScreen()),
          );
        } else if (role == 'Organiser') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const OrganiserMainScreen()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainScreen()),
          );
        }
      } else {
        // User document does not exist, redirect to login screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    } catch (e) {
      // Handle error, redirect to login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}