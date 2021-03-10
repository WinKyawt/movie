import 'dart:convert';

class Movie {
  String title;
  String posterPath;
  String overview;
  String release_date;
  Movie({this.title, this.posterPath, this.overview, this.release_date});

  String get fullImageUrl => 'https://image.tmdb.org/t/p/w200$posterPath';

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'poster_path': posterPath,
      'overview': overview,
      'release_date': release_date
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Movie(
        title: map['title'],
        posterPath: map['poster_path'],
        overview: map['overview'],
        release_date: map['release_date']);
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));
}
