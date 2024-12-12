import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:night_life/presentation/screens/admin/admin_screen.dart';
import 'package:night_life/gateway_screen.dart';
import 'package:night_life/presentation/screens/auth/login_screen.dart';
import 'package:night_life/presentation/screens/main_screen.dart';
import 'package:night_life/presentation/screens/organiser_screens/organiser_home_screen.dart';
import 'package:night_life/presentation/screens/profile/bookings_screen.dart';
import 'package:night_life/presentation/screens/profile/manage_address.dart';
import 'package:night_life/presentation/screens/profile/notification_screen.dart';
import 'package:night_life/presentation/screens/profile/rating_screen.dart';
import 'package:night_life/presentation/screens/profile/send_feedback_screen.dart';
import 'package:night_life/presentation/screens/profile/settings_screen.dart';
import 'package:night_life/presentation/screens/profile/terms_and_condition.dart';

import 'package:night_life/styles/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Night Life',
          theme: AppTheme.theme,
          initialRoute: '/',
          routes: {
            '/': (context) => const GatewayScreen(),
            '/login': (context) => const LoginScreen(),
            '/main': (context) => const MainScreen(),
            '/organiser': (context) => const OrganiserHomeScreen(),
            '/admin': (context) => const AdminScreen(),
            '/manage_address': (context) => const ManageAddress(),
            '/your_bookings': (context) => const BookingsScreen(),
            '/bookings': (context) => const BookingsScreen(),
            '/notifications': (context) => const NotificationScreen(),
            '/send_feedback': (context) => const SendFeedbackScreen(),
            '/terms_and_conditions': (context) => const TermsAndCondition(),
            '/rating': (context) => const RatingScreen(),
            '/settings': (context) => const SettingsScreen(),

          },
        );
      },
    );
  }
}