import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final organiserProvider = StateNotifierProvider<OrganiserNotifier, OrganiserState>((ref) {
  return OrganiserNotifier();
});

class OrganiserState {
  final String eventName;
  final String description;
  final String location;
  final String venueName;
  final String pricing;
  final String capacity;
  final String cancellationPolicy;
  final String phoneNumber;
  final String email;
  final DateTime? selectedStartDate;
  final TimeOfDay? selectedStartTime;
  final DateTime? selectedEndDate;
  final TimeOfDay? selectedEndTime;
  final List<XFile>? images;
  final XFile? bannerImage;
  final XFile? teaserVideo;
  final bool isPublicEvent;
  final bool isInviteOnly;

  OrganiserState({
    this.eventName = '',
    this.description = '',
    this.location = '',
    this.venueName = '',
    this.pricing = '',
    this.capacity = '',
    this.cancellationPolicy = '',
    this.phoneNumber = '',
    this.email = '',
    this.selectedStartDate,
    this.selectedStartTime,
    this.selectedEndDate,
    this.selectedEndTime,
    this.images,
    this.bannerImage,
    this.teaserVideo,
    this.isPublicEvent = true,
    this.isInviteOnly = false,
  });

  OrganiserState copyWith({
    String? eventName,
    String? description,
    String? location,
    String? venueName,
    String? pricing,
    String? capacity,
    String? cancellationPolicy,
    String? phoneNumber,
    String? email,
    DateTime? selectedStartDate,
    TimeOfDay? selectedStartTime,
    DateTime? selectedEndDate,
    TimeOfDay? selectedEndTime,
    List<XFile>? images,
    XFile? bannerImage,
    XFile? teaserVideo,
    bool? isPublicEvent,
    bool? isInviteOnly,
  }) {
    return OrganiserState(
      eventName: eventName ?? this.eventName,
      description: description ?? this.description,
      location: location ?? this.location,
      venueName: venueName ?? this.venueName,
      pricing: pricing ?? this.pricing,
      capacity: capacity ?? this.capacity,
      cancellationPolicy: cancellationPolicy ?? this.cancellationPolicy,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      selectedStartDate: selectedStartDate ?? this.selectedStartDate,
      selectedStartTime: selectedStartTime ?? this.selectedStartTime,
      selectedEndDate: selectedEndDate ?? this.selectedEndDate,
      selectedEndTime: selectedEndTime ?? this.selectedEndTime,
      images: images ?? this.images,
      bannerImage: bannerImage ?? this.bannerImage,
      teaserVideo: teaserVideo ?? this.teaserVideo,
      isPublicEvent: isPublicEvent ?? this.isPublicEvent,
      isInviteOnly: isInviteOnly ?? this.isInviteOnly,
    );
  }
}

class OrganiserNotifier extends StateNotifier<OrganiserState> {
  OrganiserNotifier() : super(OrganiserState());

  void setEventName(String name) {
    state = state.copyWith(eventName: name);
  }

  void setDescription(String description) {
    state = state.copyWith(description: description);
  }

  void setLocation(String location) {
    state = state.copyWith(location: location);
  }

  void setVenueName(String venueName) {
    state = state.copyWith(venueName: venueName);
  }

  void setPricing(String pricing) {
    state = state.copyWith(pricing: pricing);
  }

  void setCapacity(String capacity) {
    state = state.copyWith(capacity: capacity);
  }

  void setCancellationPolicy(String cancellationPolicy) {
    state = state.copyWith(cancellationPolicy: cancellationPolicy);
  }

  void setPhoneNumber(String phoneNumber) {
    state = state.copyWith(phoneNumber: phoneNumber);
  }

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setStartDate(DateTime date) {
    state = state.copyWith(selectedStartDate: date);
  }

  void setStartTime(TimeOfDay time) {
    state = state.copyWith(selectedStartTime: time);
  }

  void setEndDate(DateTime date) {
    state = state.copyWith(selectedEndDate: date);
  }

  void setEndTime(TimeOfDay time) {
    state = state.copyWith(selectedEndTime: time);
  }

  void setImages(List<XFile> images) {
    state = state.copyWith(images: images);
  }

  void setBannerImage(XFile image) {
    state = state.copyWith(bannerImage: image);
  }

  void setTeaserVideo(XFile video) {
    state = state.copyWith(teaserVideo: video);
  }

  void setPublicEvent(bool isPublic) {
    state = state.copyWith(isPublicEvent: isPublic);
  }

  void setInviteOnly(bool isInviteOnly) {
    state = state.copyWith(isInviteOnly: isInviteOnly);
  }

  Future<void> postEvent({
    required BuildContext context,
    required String eventName,
    required String description,
    required String location,
    required String venueName,
    required String pricing,
    required String capacity,
    required String cancellationPolicy,
    required String phoneNumber,
    required String email,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('events').add({
        'eventName': eventName,
        'description': description,
        'location': location,
        'venueName': venueName,
        'pricing': pricing,
        'capacity': capacity,
        'startDate': state.selectedStartDate?.toIso8601String(),
        'startTime': state.selectedStartTime?.format(context),
        'endDate': state.selectedEndDate?.toIso8601String(),
        'endTime': state.selectedEndTime?.format(context),
        'images': state.images?.map((image) => image.path).toList(),
        'bannerImage': state.bannerImage?.path,
        'teaserVideo': state.teaserVideo?.path,
        'isPublicEvent': state.isPublicEvent,
        'isInviteOnly': state.isInviteOnly,
        'cancellationPolicy': cancellationPolicy,
        'phoneNumber': phoneNumber,
        'email': email,
      });
    } catch (e) {
      throw Exception('Failed to post event: $e');
    }
  }
}