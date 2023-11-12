import 'package:injectable/injectable.dart';
import 'package:movies/data/api/api_manger.dart';
import 'package:movies/data/data_scource_contract/similar_films_source.dart';
import 'package:movies/data/models/film_details/Film_details.dart';

@Injectable(as: SimilarFilmSource)
class SimilarFilmSourceImp extends SimilarFilmSource {
  ApiManger apiManger;

  @factoryMethod
  SimilarFilmSourceImp(this.apiManger);

  @override
  Future<FilmDetail> getSimilar(num id) async {
    FilmDetail similar = await apiManger.getSimilarFilms(id);
    return similar;
  }
}
