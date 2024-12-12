import 'package:flutter/material.dart';
import 'package:night_life/styles/styles.dart';
import 'package:night_life/presentation/providers/organiser_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step2Location extends ConsumerWidget {
  final TextEditingController venueNameController;
  final TextEditingController locationController;

  const Step2Location({
    required this.venueNameController,
    required this.locationController,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final organiserNotifier = ref.read(organiserProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Step 2: Location',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: venueNameController,
          decoration: AppStyles.inputDecoration('Venue Name'),
          style: Theme.of(context).textTheme.bodyLarge,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the venue name';
            }
            return null;
          },
          onChanged: (value) => organiserNotifier.setVenueName(value),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: locationController,
          decoration: AppStyles.inputDecoration('Address'),
          style: Theme.of(context).textTheme.bodyLarge,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the address';
            }
            return null;
          },
          onChanged: (value) => organiserNotifier.setLocation(value),
        ),
        const SizedBox(height: 16),
        // Interactive map with draggable pin (Placeholder for now)
        Container(
          height: 200,
          color: Colors.grey[300],
          child: const Center(
            child: Text('Map Placeholder'),
          ),
        ),
      ],
    );
  }
}