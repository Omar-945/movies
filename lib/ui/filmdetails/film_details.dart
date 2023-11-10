import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/data/api_manger.dart';
import 'package:movies/data/models/film_details/Film_details.dart';
import 'package:movies/data/models/film_details/results.dart';
import 'package:movies/ui/filmdetails/film_type_tag.dart';
import 'package:movies/ui/tabs/home/recommend/film_poster_recomended.dart';

class FilmDetails extends StatelessWidget {
  static const String route = "FilmDetails";

  const FilmDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Result film = ModalRoute.of(context)?.settings.arguments as Result;
    String backGroundPath =
        "https://image.tmdb.org/t/p/w500${film.backdropPath}";
    String posterPath = "https://image.tmdb.org/t/p/w500${film.posterPath}";
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          film.title ?? "",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: CachedNetworkImage(
                imageUrl: backGroundPath,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Center(
                      child: Text(
                        "NO IMAGE",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover)))),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 13, start: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        film.title ?? "",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      FutureBuilder(
                          future: ApiManger.getFilmDetails(film.id!),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return SafeArea(
                                  child: Padding(
                                padding: EdgeInsets.all(20),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              ));
                            }
                            if (snapshot.hasError ||
                                snapshot.data?.statusCode == 7) {
                              return const SafeArea(
                                  child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Center(
                                          child: Text(
                                        "Some thing went wrong",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ))));
                            }
                            FilmDetail filmDetail = snapshot.data!;
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      film.releaseDate ?? "",
                                      style: TextStyle(
                                        color: Color(0xFFB5B4B4),
                                        fontSize: 10,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "-${(filmDetail.runtime)! ~/ 60}h ${filmDetail.runtime! % 60}m",
                                      style: TextStyle(
                                        color: Color(0xFFB5B4B4),
                                        fontSize: 10,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: posterPath,
                                      placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          Center(
                                        child: Text(
                                          "NO IMAGE",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      ),
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        alignment:
                                            AlignmentDirectional.topStart,
                                        width: 130,
                                        height: 200,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover)),
                                        child: Image.asset(
                                            "assets/images/add_icon.png"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 11,
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        height: 200,
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              end: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 90,
                                                child: GridView.builder(
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 2,
                                                          childAspectRatio: 3.5,
                                                          crossAxisSpacing: 12,
                                                          mainAxisSpacing: 15),
                                                  itemBuilder:
                                                      (context, index) =>
                                                          FilmTag(
                                                    type: filmDetail
                                                        .genres![index].name,
                                                  ),
                                                  itemCount:
                                                      filmDetail.genres!.length,
                                                ),
                                              ),
                                              Expanded(
                                                  child: SingleChildScrollView(
                                                child: Text(
                                                  filmDetail.overview!,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      height: 2,
                                                      fontSize: 13),
                                                ),
                                              )),
                                              SizedBox(
                                                height: 12,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    size: 25,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "${filmDetail.voteAverage!.toStringAsFixed(2)}",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Container(
                  width: double.infinity,
                  height: 300,
                  color: Theme.of(context).colorScheme.secondary,
                  padding: EdgeInsetsDirectional.only(
                    start: 27,
                    top: 16,
                    bottom: 9,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "More Like This",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      FutureBuilder(
                          future: ApiManger.getSimilarFilms(film.id!),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return SafeArea(
                                  child: Padding(
                                padding: EdgeInsets.all(20),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              ));
                            }
                            if (snapshot.hasError ||
                                snapshot.data?.statusCode == 7) {
                              return const SafeArea(
                                  child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Center(
                                          child: Text(
                                        "Some thing went wrong",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ))));
                            }
                            List<Result> films = snapshot.data!.results!;
                            return Expanded(
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                      FilmPosterRecomended(
                                        film: films[index],
                                        isFirst: false,
                                      ),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        width: 20,
                                      ),
                                  itemCount: films.length),
                            );
                          })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
