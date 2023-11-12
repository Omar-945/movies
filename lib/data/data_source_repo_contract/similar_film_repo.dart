import 'package:movies/data/models/film_details/Film_details.dart';

abstract class SimilarFilmRepo {
  Future<FilmDetail> getSimilar(num id);
}
