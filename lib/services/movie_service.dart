// movie_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';
// ignore: unused_import
import '../models/genre.dart';


class MovieService {
  final String baseUrl;
  final String apiKey;

  MovieService({required this.baseUrl, required this.apiKey});

  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      return data.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
