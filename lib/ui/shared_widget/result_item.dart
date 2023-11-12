import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/data/models/film_details/results.dart';
import 'package:movies/ui/filmdetails/film_details.dart';

class Item extends StatelessWidget {
  Result film;

  Item({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    String posterPath = "https://image.tmdb.org/t/p/w500${film.posterPath}";
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, FilmDetails.route, arguments: film);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: posterPath,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Center(
              child: Text(
                "NO IMAGE",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            width: 200,
            height: 200,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  film.title ?? "",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Text(
                  film.releaseDate ?? "",
                  style: TextStyle(color: Colors.white54, fontSize: 13),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
