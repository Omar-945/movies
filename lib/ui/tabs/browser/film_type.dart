import 'package:flutter/material.dart';
import 'package:movies/data/models/film_catagory/genres.dart';
import 'package:movies/ui/tabs/browser/catagory/showCategory.dart';

class FilmType extends StatelessWidget {
  int index;
  Genres genres;

  FilmType({super.key, required this.index, required this.genres});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ShowCategory.route, arguments: genres);
      },
      child: Container(
        width: 160,
        height: 90,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/film_type/${index + 1}.jpeg"),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(4)),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              color: Colors.black54,
            ),
            Text(
              genres.name ?? "",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
