import 'package:injectable/injectable.dart';
import 'package:movies/data/data_scource_contract/recommended_source.dart';
import 'package:movies/data/data_source_repo_contract/recommended_repo.dart';
import 'package:movies/data/models/film_details/Film_details.dart';

@Injectable(as: RecommendedRepo)
class RecommendedRepoImp extends RecommendedRepo {
  RecommendedSource source;

  @factoryMethod
  RecommendedRepoImp(this.source);

  @override
  Future<FilmDetail> getRecommended() async {
    FilmDetail recommended = await source.getRecommended();
    return recommended;
  }
}
