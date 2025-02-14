import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/genre.dart';

class GenreService {
  final String baseUrl;
  final String apiKey;

  GenreService({required this.baseUrl, required this.apiKey});

  Future<List<Genre>> fetchGenres() async {
    final response = await http.get(Uri.parse('$baseUrl/genre/movie/list?api_key=$apiKey'));

  

    if (response.statusCode == 200) {
      // Parse the response data
      final List<dynamic> data = json.decode(response.body)['genres'];
      // Map the data into a list of Genre objects
      return data.map((json) => Genre.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load genres. Status Code: ${response.statusCode}');
    }
  }
}



// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/movie.dart';

// import '../models/genre.dart';

// class MovieService {
//   final String baseUrl;
//   final String apiKey;

//   MovieService({required this.baseUrl, required this.apiKey});

//   Future<List<Movie>> fetchMovies() async {
//     final response = await http.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));
//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body)['results'];
//       return data.map((json) => Movie.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load movies');
//     }
//   }
// }
