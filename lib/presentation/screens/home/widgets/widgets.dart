import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:iconsax/iconsax.dart';
import 'package:night_life/styles/colors.dart';
import 'package:night_life/styles/styles.dart';
import 'package:drop_shadow/drop_shadow.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: Row(
          children: [
            Icon(
              Iconsax.location,
              size: 20,
            ),
            SizedBox(width: 10),
            Text(
              '10, A Street, Lagos',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.background,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextFormField(
        decoration: AppStyles.searchInputDecoration,
        style: AppStyles.body,
      ),
    );
  }
}

class Heading extends StatelessWidget {
  final String title;

  const Heading(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.primary, width: 2),
              ),
              child: Text(
                'View All',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: AppColors.white,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OfferCarousel extends StatelessWidget {
  final List<String> offers;

  const OfferCarousel(this.offers, {super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: offers.length,
      itemBuilder: (context, index, realIndex) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primary, AppColors.accent],
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                offers[index],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 200.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 1 / 1.5,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 1 / 1.2,
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final Map<String, String> event;

  const EventCard(this.event, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      //margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Hero(
            tag: event['image']!,
            child: DropShadow(
              blurRadius: 5,
              spread: 1,
              offset: const Offset(2, 5),
              child: Container(
                width: 200,
                height: 160,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(event['image']!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event['title']!,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Iconsax.location,
                      size: 16,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      event['location']!,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: AppColors.secondary,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VenueCard extends StatelessWidget {
  final Map<String, String> venue;

  const VenueCard(this.venue, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              venue['image']!,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            venue['title']!,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            venue['location']!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.secondary,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            'Fee: ${venue['fee']}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.secondary,
                ),
          ),
        ],
      ),
    );
  }
}