import 'package:bloc/bloc.dart';
import 'package:movies/data/api_manger.dart';
import 'package:movies/data/models/film_details/Film_details.dart';
import 'package:movies/data/models/film_details/results.dart';

class PopularViewModel extends Cubit<PopularStates> {
  PopularViewModel() : super(Loading());

  void getPopularFilms() async {
    emit(Loading());
    try {
      FilmDetail response = await ApiManger.getPopular();
      if (response.statusCode != null) {
        emit(Error("Some Thing Went wrong"));
      } else {
        emit(Success(response.results ?? []));
      }
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}

sealed class PopularStates {}

class Success extends PopularStates {
  List<Result> films;

  Success(this.films);
}

class Error extends PopularStates {
  String error;

  Error(this.error);
}

class Loading extends PopularStates {}
