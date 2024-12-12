import 'package:night_life/domain/entities/event.dart';

abstract class EventRepository {
  Future<void> postEvent(Event event);
}