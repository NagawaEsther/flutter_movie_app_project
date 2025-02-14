// movie_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/movie_service.dart';
import '../models/movie.dart';

final movieServiceProvider = Provider<MovieService>((ref) {
  return MovieService(baseUrl: 'https://api.themoviedb.org/3', apiKey: 'cb8f343a0eee9a1d0470c15d6306fd5c');
});

final movieProvider = FutureProvider<List<Movie>>((ref) async {
  final service = ref.read(movieServiceProvider);
  return service.fetchMovies();
});
