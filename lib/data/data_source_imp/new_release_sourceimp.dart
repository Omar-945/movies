import 'package:injectable/injectable.dart';
import 'package:movies/data/api/api_manger.dart';
import 'package:movies/data/data_scource_contract/new_release_source.dart';
import 'package:movies/data/models/film_details/Film_details.dart';

@Injectable(as: NewReleaseSource)
class NewReleaseSourceImp extends NewReleaseSource {
  ApiManger apiManger;

  @factoryMethod
  NewReleaseSourceImp(this.apiManger);

  @override
  Future<FilmDetail> getRelease() async {
    FilmDetail newRelease = await apiManger.getRecent();
    return newRelease;
  }
}
