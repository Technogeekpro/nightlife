import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:night_life/presentation/screens/organiser_screens/pages/event_details.dart';
import 'package:night_life/presentation/screens/organiser_screens/pages/location_detail.dart';
import 'package:night_life/presentation/screens/organiser_screens/pages/media_upload.dart';
import 'package:night_life/presentation/screens/organiser_screens/pages/organizer_settings.dart';
import 'package:night_life/styles/colors.dart';

class OrganiserHomeScreen extends ConsumerStatefulWidget {
  const OrganiserHomeScreen({super.key});

  @override
  ConsumerState<OrganiserHomeScreen> createState() =>
      _OrganiserHomeScreenState();
}

class _OrganiserHomeScreenState extends ConsumerState<OrganiserHomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 3) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController eventNameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController locationController = TextEditingController();
    final TextEditingController venueNameController = TextEditingController();
    final TextEditingController cancellationPolicyController =
        TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Event'),
        backgroundColor: AppColors.background,
        actions: [
          TextButton(
            onPressed: _nextPage,
            child: const Text(
              'Next',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: (_currentPage + 1) / 4,
            backgroundColor: Colors.grey[300],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  Step1EventDetails(
                    eventNameController: eventNameController,
                    descriptionController: descriptionController,
                  ),
                  Step2Location(
                    venueNameController: venueNameController,
                    locationController: locationController,
                  ),
                  const Step3MediaUpload(),
                  OrganiserSettings(
                      cancellationPolicyController:
                          cancellationPolicyController,
                      phoneNumberController: phoneNumberController,
                      emailController: emailController)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
