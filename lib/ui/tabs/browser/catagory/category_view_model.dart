import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/api_manger.dart';
import 'package:movies/data/models/film_details/results.dart';

class CategoryViewModel extends Cubit<CategoryState> {
  CategoryViewModel() : super(Loading());

  void getFilms(int id) async {
    emit(Loading());
    try {
      var response = await ApiManger.getGenereFilm(id);
      print(response.results);
      if (response.statusCode != null) {
        emit(Error("Some thing wnent Wrong!"));
      } else {
        emit(Success(response.results ?? []));
      }
    } catch (e) {
      Error(e.toString());
    }
  }
}

sealed class CategoryState {}

class Loading extends CategoryState {}

class Success extends CategoryState {
  List<Result> types;

  Success(this.types);
}

class Error extends CategoryState {
  String error;

  Error(this.error);
}
