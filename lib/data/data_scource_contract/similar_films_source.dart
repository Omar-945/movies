import 'package:movies/data/models/film_details/Film_details.dart';

abstract class SimilarFilmSource {
  Future<FilmDetail> getSimilar(num id);
}
