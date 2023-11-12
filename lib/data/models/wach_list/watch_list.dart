import 'package:movies/data/models/film_details/Film_details.dart';

class WatchListFilms {
  static List<FilmDetail>? films;

  WatchListFilms.fromjson(dynamic json) {
    if (json['films'] != null) {
      films = [];
      json['films'].forEach((v) {
        films?.add(FilmDetail.fromJson(v));
      });
    }
  }
}
