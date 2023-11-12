import 'package:injectable/injectable.dart';
import 'package:movies/data/api/api_manger.dart';
import 'package:movies/data/data_scource_contract/film_details_source.dart';
import 'package:movies/data/models/film_details/Film_details.dart';

@Injectable(as: FilmDetailsSource)
class FilmDetailsSourceImp extends FilmDetailsSource {
  ApiManger apiManger;

  FilmDetailsSourceImp(this.apiManger);

  @override
  Future<FilmDetail> getFilm(num id) async {
    FilmDetail film = await apiManger.getFilmDetails(id);
    return film;
  }
}
