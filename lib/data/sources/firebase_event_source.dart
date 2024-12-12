import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:night_life/data/models/event_model.dart';

class FirebaseEventSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> postEvent(EventModel event) async {
    await _firestore.collection('events').add(event.toJson());
  }
}