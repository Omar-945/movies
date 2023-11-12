// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/api/api_manger.dart' as _i3;
import '../data/data_scource_contract/categorized_film_source.dart' as _i4;
import '../data/data_scource_contract/film_details_source.dart' as _i6;
import '../data/data_scource_contract/new_release_source.dart' as _i8;
import '../data/data_scource_contract/popular_film_source_contract.dart'
    as _i10;
import '../data/data_scource_contract/recommended_source.dart' as _i12;
import '../data/data_scource_contract/search_data_source.dart' as _i14;
import '../data/data_scource_contract/similar_films_source.dart' as _i16;
import '../data/data_source_imp/categorized_film_sourceimp.dart' as _i5;
import '../data/data_source_imp/film_details_sourceimp.dart' as _i7;
import '../data/data_source_imp/new_release_sourceimp.dart' as _i9;
import '../data/data_source_imp/popular_film_sourceimp.dart' as _i11;
import '../data/data_source_imp/recommended_sourceimp.dart' as _i13;
import '../data/data_source_imp/search_data_sourceimp.dart' as _i15;
import '../data/data_source_imp/similar_films_sourceimp.dart' as _i17;
import '../data/data_source_repo_contract/categorized_film_repo.dart' as _i18;
import '../data/data_source_repo_contract/film_details_repo.dart' as _i21;
import '../data/data_source_repo_contract/new_release_repo.dart' as _i24;
import '../data/data_source_repo_contract/popular_film_repo.dart' as _i26;
import '../data/data_source_repo_contract/recommended_repo.dart' as _i29;
import '../data/data_source_repo_contract/search_data_repo.dart' as _i32;
import '../data/data_source_repo_contract/similar_film_repo.dart' as _i35;
import '../data/data_source_repo_imp/categorized_film_repoimp.dart' as _i19;
import '../data/data_source_repo_imp/film_details_repoimp.dart' as _i22;
import '../data/data_source_repo_imp/new_release_repoimp.dart' as _i25;
import '../data/data_source_repo_imp/popular_film_repoimp.dart' as _i27;
import '../data/data_source_repo_imp/recommended_repoimp.dart' as _i30;
import '../data/data_source_repo_imp/search_data_repoimp.dart' as _i33;
import '../data/data_source_repo_imp/similar_film_repoimp.dart' as _i36;
import '../ui/filmdetails/film_details_view_model.dart' as _i23;
import '../ui/filmdetails/similar_films/similar_film_view_model.dart' as _i37;
import '../ui/tabs/browser/catagory/category_view_model.dart' as _i20;
import '../ui/tabs/home/new_realese/new_reales_view_model.dart' as _i38;
import '../ui/tabs/home/popular/popular_view_model.dart' as _i28;
import '../ui/tabs/home/recommend/recommended_view_model.dart' as _i31;
import '../ui/tabs/search/search_view_model.dart' as _i34;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManger>(_i3.ApiManger());
    gh.factory<_i4.CategorizedFilmSource>(
        () => _i5.CategorizedFilmSourceimp(gh<_i3.ApiManger>()));
    gh.factory<_i6.FilmDetailsSource>(
        () => _i7.FilmDetailsSourceImp(gh<_i3.ApiManger>()));
    gh.factory<_i8.NewReleaseSource>(
        () => _i9.NewReleaseSourceImp(gh<_i3.ApiManger>()));
    gh.factory<_i10.PopularFilmSource>(
        () => _i11.PopularFilmSourceimp(gh<_i3.ApiManger>()));
    gh.factory<_i12.RecommendedSource>(
        () => _i13.RecommendedSourceImp(gh<_i3.ApiManger>()));
    gh.factory<_i14.SearchSource>(
        () => _i15.SearchSourceImp(gh<_i3.ApiManger>()));
    gh.factory<_i16.SimilarFilmSource>(
        () => _i17.SimilarFilmSourceImp(gh<_i3.ApiManger>()));
    gh.factory<_i18.CategorizedFilmRepo>(
        () => _i19.CategorizedFilmRepoimp(gh<_i4.CategorizedFilmSource>()));
    gh.factory<_i20.CategoryViewModel>(
        () => _i20.CategoryViewModel(gh<_i18.CategorizedFilmRepo>()));
    gh.factory<_i21.FilmDetailsRepo>(
        () => _i22.FilmDetailsRepoImp(gh<_i6.FilmDetailsSource>()));
    gh.factory<_i23.FilmDetailsViewModel>(
        () => _i23.FilmDetailsViewModel(gh<_i21.FilmDetailsRepo>()));
    gh.factory<_i24.NewReleaseRepo>(
        () => _i25.NewReleaseRepoImp(gh<_i8.NewReleaseSource>()));
    gh.factory<_i26.PopularFilmRepo>(
        () => _i27.PopularFilmRepoImp(gh<_i10.PopularFilmSource>()));
    gh.factory<_i28.PopularViewModel>(
        () => _i28.PopularViewModel(gh<_i26.PopularFilmRepo>()));
    gh.factory<_i29.RecommendedRepo>(
        () => _i30.RecommendedRepoImp(gh<_i12.RecommendedSource>()));
    gh.factory<_i31.RecommendedViewModel>(
        () => _i31.RecommendedViewModel(gh<_i29.RecommendedRepo>()));
    gh.factory<_i32.SearchRepo>(
        () => _i33.SearchRepoImp(gh<_i14.SearchSource>()));
    gh.factory<_i34.SearchViewModel>(
        () => _i34.SearchViewModel(gh<_i32.SearchRepo>()));
    gh.factory<_i35.SimilarFilmRepo>(
        () => _i36.SimilarFilmRepoImp(gh<_i16.SimilarFilmSource>()));
    gh.factory<_i37.SimilarFilmsViewModel>(
        () => _i37.SimilarFilmsViewModel(gh<_i35.SimilarFilmRepo>()));
    gh.factory<_i38.NewRealeseViewModel>(
        () => _i38.NewRealeseViewModel(gh<_i24.NewReleaseRepo>()));
    return this;
  }
}
