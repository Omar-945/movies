import 'package:movies/data/models/film_details/Film_details.dart';

abstract class NewReleaseSource {
  Future<FilmDetail> getRelease();
}
