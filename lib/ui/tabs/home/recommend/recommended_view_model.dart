import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/api/api_manger.dart';
import 'package:movies/data/models/film_details/Film_details.dart';
import 'package:movies/data/models/film_details/results.dart';

class RecommendedViewModel extends Cubit<RecommendedState> {
  RecommendedViewModel() : super(Loading());

  void getRecommended() async {
    emit(Loading());
    try {
      FilmDetail response = await ApiManger.getRecommended();
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

sealed class RecommendedState {}

class Success extends RecommendedState {
  List<Result> films;

  Success(this.films);
}

class Loading extends RecommendedState {}

class Error extends RecommendedState {
  String error;

  Error(this.error);
}
