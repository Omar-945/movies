import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/data_source_repo_contract/film_details_repo.dart';
import 'package:movies/data/models/film_details/Film_details.dart';

@injectable
class FilmDetailsViewModel extends Cubit<FilmDetailsState> {
  FilmDetailsRepo repo;

  @factoryMethod
  FilmDetailsViewModel(this.repo) : super(Loading());

  void getFilm(num id) async {
    try {
      FilmDetail film = await repo.getFilm(id);
      emit(Success(film));
    } catch (e) {
      emit(Error("Some thine went Wrong!, ${e.toString()}"));
    }
  }
}

sealed class FilmDetailsState {}

class Success extends FilmDetailsState {
  FilmDetail film;

  Success(this.film);
}

class Error extends FilmDetailsState {
  String error;

  Error(this.error);
}

class Loading extends FilmDetailsState {}
