import 'package:movies/data/models/film_details/Film_details.dart';

abstract class FilmDetailsRepo {
  Future<FilmDetail> getFilm(num id);
}
