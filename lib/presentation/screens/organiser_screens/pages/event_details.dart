import 'package:flutter/material.dart';
import 'package:night_life/styles/styles.dart';
import 'package:night_life/presentation/providers/organiser_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step1EventDetails extends ConsumerWidget {
  final TextEditingController eventNameController;
  final TextEditingController descriptionController;

  const Step1EventDetails({
    required this.eventNameController,
    required this.descriptionController,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final organiserNotifier = ref.read(organiserProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Step 1: Event Details',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: eventNameController,
          decoration: AppStyles.inputDecoration('Event Name'),
          style: Theme.of(context).textTheme.bodyLarge,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the event name';
            }
            return null;
          },
          onChanged: (value) => organiserNotifier.setEventName(value),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: descriptionController,
          decoration: AppStyles.inputDecoration('Event Description'),
          style: Theme.of(context).textTheme.bodyLarge,
          maxLines: 4,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the event description';
            }
            return null;
          },
          onChanged: (value) => organiserNotifier.setDescription(value),
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          decoration: AppStyles.inputDecoration('Event Category'),
          items: ['Party', 'Clubbing', 'Concert', 'Workshop']
              .map((category) => DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  ))
              .toList(),
          onChanged: (value) {
            // organiserNotifier.setCategory(value!);
          },
        ),
      ],
    );
  }
}