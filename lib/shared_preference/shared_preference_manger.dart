import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:movies/data/models/film_details/Film_details.dart';
import 'package:movies/data/models/wach_list/watch_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class LocalStorage {
  static const String filmKey = "films";

  Future<void> addList(List<FilmDetail> watchList) async {
    String json = jsonEncode(watchList);
    try {
      SharedPreferences init = await SharedPreferences.getInstance();
      await init.setString(filmKey, json);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<FilmDetail>> getFilms() async {
    try {
      SharedPreferences init = await SharedPreferences.getInstance();
      String? data = init.getString(filmKey);
      var json = jsonDecode(data ?? "");
      FilmDetail.fromJson(json);
      List<FilmDetail> films = WatchListFilms.films ?? [];
      return films;
    } catch (e) {
      print(e.toString());
    }
    return [];
  }
}
