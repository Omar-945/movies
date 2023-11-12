import 'package:movies/data/models/film_details/Film_details.dart';

abstract class RecommendedSource {
  Future<FilmDetail> getRecommended();
}
