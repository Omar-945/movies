import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/data/models/film_catagory/film_category.dart';
import 'package:movies/data/models/film_details/Film_details.dart';

class ApiManger {
  static const String host = "api.themoviedb.org";
  static const Map<String, String> headers = {
    "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZTU2Yzg2MzZiOTExOTBhMDdkNmExOWM5OWYyMDgzYyIsInN1YiI6IjY1NDE1Yzg3YjY4NmI5MDBlMTE4MDg1YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.45qrNJVRNiUMtYid_qmIp5kKJ_Q0Obk-yRRywYsGgP8",
    "accept": "application/json"
  };

  static Future<FilmDetail> getPopular() async {
    var url = Uri.https(host, "3/movie/popular", {
      "language": "en-US",
      "page": "1",
    });

    var response = await http.get(url, headers: headers);
    var jsonFile = jsonDecode(response.body);
    var popularResponse = FilmDetail.fromJson(jsonFile);
    return popularResponse;
  }

  static Future<FilmDetail> getRecent() async {
    var url = Uri.https(host, "/3/movie/upcoming", {
      "language": "en-US",
    });

    var response = await http.get(url, headers: headers);
    var jsonFile = jsonDecode(response.body);
    var releasesResponse = FilmDetail.fromJson(jsonFile);
    return releasesResponse;
  }

  static Future<FilmDetail> getRecommended() async {
    Uri url = Uri.https(host, "/3/movie/top_rated", {"language": "en_US"});
    var response = await http.get(url, headers: headers);
    var json = jsonDecode(response.body);
    FilmDetail films = FilmDetail.fromJson(json);
    return films;
  }

  static Future<FilmDetail> getFilmDetails(int filmId) async {
    Uri url = Uri.https(host, "/3/movie/${filmId}", {"language": "en_US"});
    var response = await http.get(url, headers: headers);
    var json = jsonDecode(response.body);
    FilmDetail filmDetail = FilmDetail.fromJson(json);
    return filmDetail;
  }

  static Future<FilmDetail> getSimilarFilms(int filmId) async {
    Uri url =
        Uri.https(host, "/3/movie/$filmId/similar", {"language": "en_US"});
    var response = await http.get(url, headers: headers);
    var json = jsonDecode(response.body);
    FilmDetail similar = FilmDetail.fromJson(json);
    return similar;
  }

  static Future<FilmDetail> getSearchResults(String query) async {
    Uri url = Uri.https(
        host, "3/search/movie", {"language": "en_US", "query": query});
    var response = await http.get(url, headers: headers);
    var json = jsonDecode(response.body);
    FilmDetail results = FilmDetail.fromJson(json);
    return results;
  }

  static Future<FilmCategory> getCategory() async {
    Uri url = Uri.https(host, "3/genre/movie/list", {"language": "en_US"});
    var response = await http.get(url, headers: headers);
    var json = jsonDecode(response.body);
    FilmCategory results = FilmCategory.fromJson(json);
    return results;
  }

  static Future<FilmDetail> getGenereFilm(int id) async {
    Uri url = Uri.https(host, "3/discover/movie", {
      "language": "en_US",
      "sort_by": "popularity.desc",
      "with_genres": id.toString(),
      "page": "1",
    });
    var response = await http.get(url, headers: headers);
    var json = jsonDecode(response.body);
    return FilmDetail.fromJson(json);
  }
}
