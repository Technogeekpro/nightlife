import 'package:flutter/material.dart';
import 'package:night_life/presentation/screens/event_detail_screen.dart';
import 'package:night_life/presentation/screens/home/widgets/widgets.dart';
import 'package:night_life/styles/colors.dart';
import 'package:night_life/data/mock_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomSearchBar(),
            const SizedBox(height: 42),
            const Heading('Offers'),
            const SizedBox(height: 16),
            const OfferCarousel(offers),
            const SizedBox(height: 16),
            const Heading('Upcoming Events'),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: events.length,
                padding: const EdgeInsets.symmetric(horizontal: 0),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventDetailScreen(
                            imageUrl: events[index]['image']!,
                            title: events[index]['title']!,
                            description: events[index]['description']!,
                          ),
                        ),
                      );
                    },
                    child: EventCard(events[index]),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            const Heading('Popular Venues'),
            const SizedBox(height: 16),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: events.length,
                padding: const EdgeInsets.symmetric(horizontal: 0),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventDetailScreen(
                            imageUrl: events[index]['image']!,
                            title: events[index]['title']!,
                            description: events[index]['description']!,
                          ),
                        ),
                      );
                    },
                    child: EventCard(events[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
