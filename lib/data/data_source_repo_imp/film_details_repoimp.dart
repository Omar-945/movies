import 'package:injectable/injectable.dart';
import 'package:movies/data/data_scource_contract/film_details_source.dart';
import 'package:movies/data/data_source_repo_contract/film_details_repo.dart';
import 'package:movies/data/models/film_details/Film_details.dart';

@Injectable(as: FilmDetailsRepo)
class FilmDetailsRepoImp extends FilmDetailsRepo {
  FilmDetailsSource source;

  @factoryMethod
  FilmDetailsRepoImp(this.source);

  @override
  Future<FilmDetail> getFilm(num id) async {
    FilmDetail film = await source.getFilm(id);
    return film;
  }
}
