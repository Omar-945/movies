import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/api_manger.dart';
import 'package:movies/data/models/film_details/Film_details.dart';
import 'package:movies/data/models/film_details/results.dart';

class NewRealeseViewModel extends Cubit<NewRealeseState> {
  NewRealeseViewModel() : super(Loading());

  void getNewReales() async {
    emit(Loading());
    try {
      FilmDetail response = await ApiManger.getRecent();
      if (response.statusCode != null) {
        emit(Error("some thing went Wrong !"));
      } else {
        emit(Success(response.results ?? []));
      }
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}

sealed class NewRealeseState {}

class Success extends NewRealeseState {
  List<Result> films;

  Success(this.films);
}

class Loading extends NewRealeseState {}

class Error extends NewRealeseState {
  String error;

  Error(this.error);
}
