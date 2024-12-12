import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:night_life/styles/styles.dart';
import 'package:night_life/presentation/providers/organiser_provider.dart';

class OrganiserSettings extends ConsumerWidget {
  final TextEditingController cancellationPolicyController;
  final TextEditingController phoneNumberController;
  final TextEditingController emailController;

  const OrganiserSettings({
    required this.cancellationPolicyController,
    required this.phoneNumberController,
    required this.emailController,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final organiserNotifier = ref.read(organiserProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Step 4: Organizer Settings',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: cancellationPolicyController,
          decoration: AppStyles.inputDecoration('Cancellation Policy'),
          style: Theme.of(context).textTheme.bodyLarge,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the cancellation policy';
            }
            return null;
          },
          onChanged: (value) => organiserNotifier.setCancellationPolicy(value),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: phoneNumberController,
          decoration: AppStyles.inputDecoration('Phone Number'),
          style: Theme.of(context).textTheme.bodyLarge,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the phone number';
            }
            return null;
          },
          onChanged: (value) => organiserNotifier.setPhoneNumber(value),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: emailController,
          decoration: AppStyles.inputDecoration('Email Address'),
          style: Theme.of(context).textTheme.bodyLarge,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the email address';
            }
            return null;
          },
          onChanged: (value) => organiserNotifier.setEmail(value),
        ),
      ],
    );
  }
}
