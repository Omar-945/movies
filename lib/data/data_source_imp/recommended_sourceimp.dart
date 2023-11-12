import 'package:injectable/injectable.dart';
import 'package:movies/data/api/api_manger.dart';
import 'package:movies/data/data_scource_contract/recommended_source.dart';
import 'package:movies/data/models/film_details/Film_details.dart';

@Injectable(as: RecommendedSource)
class RecommendedSourceImp extends RecommendedSource {
  ApiManger apiManger;

  @factoryMethod
  RecommendedSourceImp(this.apiManger);

  @override
  Future<FilmDetail> getRecommended() async {
    FilmDetail recommended = await apiManger.getRecommended();
    return recommended;
  }
}
