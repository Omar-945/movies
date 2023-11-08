import 'package:flutter/material.dart';
import 'package:movies/data/models/film_details/results.dart';
import '../../../data/api_manger.dart';
import 'film_poster.dart';

import 'film_poster_recomended.dart';

class FilmsContainer extends StatelessWidget {
  String title;
  bool isRecommended;
  double? height;

  FilmsContainer(
      {super.key,
      required this.title,
      this.isRecommended = false,
      this.height = 200});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
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
            title,
            style: TextStyle(fontSize: 17, color: Colors.white),
          ),
          SizedBox(
            height: 16,
          ),
          isRecommended
              ? FutureBuilder(
                  future: ApiManger.getRecommended(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SafeArea(
                          child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Center(child: CircularProgressIndicator()),
                      ));
                    }
                    if (snapshot.hasError || snapshot.data?.statusCode == 7) {
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
                          itemBuilder: (context, index) => FilmPosterRecomended(
                                film: films[index],
                              ),
                          separatorBuilder: (context, index) => const SizedBox(
                                width: 20,
                              ),
                          itemCount: 20),
                    );
                  })
              : FutureBuilder(
                  future: ApiManger.getRecent(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SafeArea(
                          child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Center(child: CircularProgressIndicator()),
                      ));
                    }
                    if (snapshot.hasError || snapshot.data?.statusCode == 7) {
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
                          itemBuilder: (context, index) => FilmPoster(
                                film: films[index],
                              ),
                          separatorBuilder: (context, index) => const SizedBox(
                                width: 20,
                              ),
                          itemCount: 20),
                    );
                  })
        ],
      ),
    );
  }
}
