import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_m7/domain/entities/actor.dart';
import 'package:proyecto_m7/presentation/providers/actors/actors_repository_provider.dart';


final actorMapNotifierProvider =
    StateNotifierProvider<ActorMapNotifier, Map<String, List<Actor>>>((ref) {
  final fetchActor = ref.watch(actorRepositoryProvider);

  return ActorMapNotifier(fetchActor: fetchActor.getActorsByMovie);
});

typedef ActorCallback = Future<List<Actor>> Function(String movieId);

class ActorMapNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final ActorCallback fetchActor;

  ActorMapNotifier({required this.fetchActor}) : super({});

  Future<void> loadActor(String movieId) async {
    if (state[movieId] != null) return;

    final actor = await fetchActor(movieId);

    state = {...state, movieId: actor};
  }
}
