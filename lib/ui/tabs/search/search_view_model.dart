import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/api/api_manger.dart';
import 'package:movies/data/models/film_details/Film_details.dart';
import 'package:movies/data/models/film_details/results.dart';

class SearchViewModel extends Cubit<SearchState> {
  SearchViewModel() : super(Empty());

  void getResults(String query) async {
    emit(Empty());
    try {
      FilmDetail response = await ApiManger.getSearchResults(query);
      if (response.statusCode != null) {
        emit(Error("Some thing went Wrong!"));
      } else if (response.results!.isEmpty) {
        emit(Empty());
      } else {
        emit(Success(response.results!));
      }
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}

sealed class SearchState {}

class Empty extends SearchState {}

class Error extends SearchState {
  String error;

  Error(this.error);
}

class Success extends SearchState {
  List<Result> films;

  Success(this.films);
}
