import 'package:flutter/material.dart';
import 'package:night_life/domain/entities/event.dart';

class EventModel extends Event {
  EventModel({
    required super.eventName,
    required super.description,
    required super.location,
    required super.venueName,
    required super.pricing,
    required super.capacity,
    required super.startDate,
    required super.startTime,
    required super.endDate,
    required super.endTime,
    required super.images,
    required super.bannerImage,
    required super.teaserVideo,
    required super.isPublicEvent,
    required super.isInviteOnly,
    required super.cancellationPolicy,
    required super.phoneNumber,
    required super.email,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      eventName: json['eventName'],
      description: json['description'],
      location: json['location'],
      venueName: json['venueName'],
      pricing: json['pricing'],
      capacity: json['capacity'],
      startDate: DateTime.parse(json['startDate']),
      startTime: TimeOfDay(
        hour: int.parse(json['startTime'].split(':')[0]),
        minute: int.parse(json['startTime'].split(':')[1]),
      ),
      endDate: DateTime.parse(json['endDate']),
      endTime: TimeOfDay(
        hour: int.parse(json['endTime'].split(':')[0]),
        minute: int.parse(json['endTime'].split(':')[1]),
      ),
      images: List<String>.from(json['images']),
      bannerImage: json['bannerImage'],
      teaserVideo: json['teaserVideo'],
      isPublicEvent: json['isPublicEvent'],
      isInviteOnly: json['isInviteOnly'],
      cancellationPolicy: json['cancellationPolicy'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'eventName': eventName,
      'description': description,
      'location': location,
      'venueName': venueName,
      'pricing': pricing,
      'capacity': capacity,
      'startDate': startDate?.toIso8601String(),
      'startTime': '${startTime?.hour}:${startTime?.minute}',
      'endDate': endDate?.toIso8601String(),
      'endTime': '${endTime?.hour}:${endTime?.minute}',
      'images': images,
      'bannerImage': bannerImage,
      'teaserVideo': teaserVideo,
      'isPublicEvent': isPublicEvent,
      'isInviteOnly': isInviteOnly,
      'cancellationPolicy': cancellationPolicy,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }
}