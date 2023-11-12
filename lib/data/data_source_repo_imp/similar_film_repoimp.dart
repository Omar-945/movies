import 'package:injectable/injectable.dart';
import 'package:movies/data/data_scource_contract/similar_films_source.dart';
import 'package:movies/data/data_source_repo_contract/similar_film_repo.dart';
import 'package:movies/data/models/film_details/Film_details.dart';

@Injectable(as: SimilarFilmRepo)
class SimilarFilmRepoImp extends SimilarFilmRepo {
  SimilarFilmSource source;

  @factoryMethod
  SimilarFilmRepoImp(this.source);

  @override
  Future<FilmDetail> getSimilar(num id) async {
    FilmDetail similar = await source.getSimilar(id);
    return similar;
  }
}
