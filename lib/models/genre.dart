import 'package:json_annotation/json_annotation.dart';

part 'genre.g.dart';  // This will link to the generated file

@JsonSerializable()
class Genre {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });

  // Factory constructor for creating a Genre object from JSON
  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  // Method to convert Genre object to JSON format
  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable()
class GenreList {
  final List<Genre> genres;

  GenreList({required this.genres});

  // Factory constructor for creating a GenreList object from JSON
  factory GenreList.fromJson(Map<String, dynamic> json) => _$GenreListFromJson(json);

  // Method to convert GenreList object to JSON format
  Map<String, dynamic> toJson() => _$GenreListToJson(this);
}
