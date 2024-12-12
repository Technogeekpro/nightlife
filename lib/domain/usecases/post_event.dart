import 'package:night_life/domain/entities/event.dart';
import 'package:night_life/domain/repositories/event_repository.dart';

class PostEvent {
  final EventRepository repository;

  PostEvent(this.repository);

  Future<void> call(Event event) async {
    await repository.postEvent(event);
  }
}