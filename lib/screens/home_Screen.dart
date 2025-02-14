// home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/movie_provider.dart';
import '../providers/genre_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesAsyncValue = ref.watch(movieProvider);
    final genresAsyncValue = ref.watch(genreProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Movie DB')),
      body: Column(
        children: [
          Expanded(
            child: moviesAsyncValue.when(
              data: (movies) => ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return ListTile(
                    leading: movie.posterPath != null
                        ? Image.network('https://image.tmdb.org/t/p/w200${movie.posterPath}')
                        : Icon(Icons.movie),
                    title: Text(movie.title),
                    subtitle: Text(movie.releaseDate ?? 'Unknown Release Date'),
                  );
                },
              ),
              loading: () => Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(child: Text('Error: $error')),
            ),
          ),
          Expanded(
            child: genresAsyncValue.when(
              data: (genres) => ListView.builder(
                itemCount: genres.length,
                itemBuilder: (context, index) {
                  final genre = genres[index];
                  return ListTile(
                    title: Text(genre.name),
                  );
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(child: Text('Error: $error')),
            ),
          ),
        ],
      ),
    );
  }
}
