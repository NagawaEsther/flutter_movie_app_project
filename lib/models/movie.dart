class Movie {
  final int id;
  final String title;
  final String? originalTitle;
  final String? overview;
  final String? releaseDate;
  final double? voteAverage;
  final String? posterPath;
  final String? backdropPath;
  final String? originalLanguage;
  final List<int>? genreIds;

  Movie({
    required this.id,
    required this.title,
    this.originalTitle,
    this.overview,
    this.releaseDate,
    this.voteAverage,
    this.posterPath,
    this.backdropPath,
    this.originalLanguage,
    this.genreIds,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average']?.toDouble(),
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      originalLanguage: json['original_language'],
      genreIds: List<int>.from(json['genre_ids'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'original_title': originalTitle,
      'overview': overview,
      'release_date': releaseDate,
      'vote_average': voteAverage,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'original_language': originalLanguage,
      'genre_ids': genreIds,
    };
  }
}

