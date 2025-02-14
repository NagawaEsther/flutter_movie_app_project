// genre_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/genre_service.dart';
import '../models/genre.dart';

final genreServiceProvider = Provider<GenreService>((ref) {
  return GenreService(baseUrl: 'https://api.themoviedb.org/3', apiKey: 'cb8f343a0eee9a1d0470c15d6306fd5c');
});

final genreProvider = FutureProvider<List<Genre>>((ref) async {
  final service = ref.read(genreServiceProvider);
  return service.fetchGenres();
});
