import 'package:flutter/material.dart';

class Event {
  final String eventName;
  final String description;
  final String location;
  final String venueName;
  final String pricing;
  final String capacity;
  final DateTime? startDate;
  final TimeOfDay? startTime;
  final DateTime? endDate;
  final TimeOfDay? endTime;
  final List<String>? images;
  final String? bannerImage;
  final String? teaserVideo;
  final bool isPublicEvent;
  final bool isInviteOnly;
  final String cancellationPolicy;
  final String phoneNumber;
  final String email;

  Event({
    required this.eventName,
    required this.description,
    required this.location,
    required this.venueName,
    required this.pricing,
    required this.capacity,
    required this.startDate,
    required this.startTime,
    required this.endDate,
    required this.endTime,
    required this.images,
    required this.bannerImage,
    required this.teaserVideo,
    required this.isPublicEvent,
    required this.isInviteOnly,
    required this.cancellationPolicy,
    required this.phoneNumber,
    required this.email,
  });
}