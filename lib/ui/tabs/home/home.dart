import 'package:flutter/material.dart';
import 'package:movies/ui/tabs/home/popular/popular_bulder.dart';

import 'films_container.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Popular(),
          SizedBox(
            height: 25,
          ),
          FilmsContainer(
            title: "New Releases ",
          ),
          SizedBox(
            height: 41,
          ),
          FilmsContainer(
            title: "Recommended",
            height: 300,
            isRecommended: true,
          ),
        ],
      ),
    );
  }
}
