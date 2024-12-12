import 'package:flutter/material.dart';
import 'package:night_life/data/mock_data.dart';
import 'package:night_life/presentation/screens/home/widgets/widgets.dart';
import 'package:night_life/styles/colors.dart';

class VenueScreen extends StatefulWidget {
  const VenueScreen({super.key});

  @override
  State<VenueScreen> createState() => _VenueScreenState();
}

class _VenueScreenState extends State<VenueScreen> {
  final List<String> _filters = ['All', 'Clubs', 'Bars', 'Lounges'];
  final List<String> _selectedFilters = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSearchBar(),
            const SizedBox(height: 16),
            _buildFilterChips(),
            const SizedBox(height: 16),
            const Heading('Discover Venue for'),
            const SizedBox(height: 16),
            _buildDiscoverVenues(),
            const SizedBox(height: 16),
            const Heading('Popular Venues'),
            const SizedBox(height: 16),
            _buildPopularVenues(),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Wrap(
        spacing: 8.0,
        children: _filters.map((filter) {
          final isSelected = _selectedFilters.contains(filter);
          return FilterChip(
            label: Text(filter),
            selected: isSelected,
            onSelected: (selected) {
              setState(() {
                if (selected) {
                  _selectedFilters.add(filter);
                } else {
                  _selectedFilters.remove(filter);
                }
              });
            },
            selectedColor: AppColors.primary,
            backgroundColor: AppColors.secondary.withOpacity(0.2),
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : AppColors.secondary,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDiscoverVenues() {
    final List<Map<String, String>> discoverVenues = [
      {
        'title': 'Clubs',
        'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLig1H5cfDbpeQEeeMn1zGuHLRJZ87Y-GT2w&s',
      },
      {
        'title': 'Bars',
        'image': 'https://img-cdn.thepublive.com/fit-in/853x480/filters:format(webp)/thetatva/media/post_attachments/wp-content/uploads/2024/07/GTM-Best-US-Bars-Katana-Kitten-FT-BLOG0423-fa9f2ba9925c47abb4afb0abd25d915a.jpg',
      },
      {
        'title': 'Lounges',
        'image': 'https://kannurairport.aero/kial/public/uploads/lounge_img/jFk0BBH45FdJuoeF3AYqRGGnSi9N40.jpg',
      },
    ];

    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: discoverVenues.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    discoverVenues[index]['image']!,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  discoverVenues[index]['title']!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPopularVenues() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: venues.map((venue) => VenueCard(venue)).toList(),
      ),
    );
  }
}