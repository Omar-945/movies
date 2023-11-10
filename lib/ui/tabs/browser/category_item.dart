import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/data/models/film_details/results.dart';

class CategoryItem extends StatelessWidget {
  Result filmDetail;

  CategoryItem({super.key, required this.filmDetail});

  @override
  Widget build(BuildContext context) {
    String posterPath =
        "https://image.tmdb.org/t/p/w500${filmDetail.posterPath}";
    return Column(
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
          height: 5,
        ),
        Expanded(
          child: Text(
            filmDetail.title ?? "",
            maxLines: 1,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              color: Color(0xFFFFFFFF),
              fontSize: 14,
            ),
          ),
        )
      ],
    );
  }
}
