import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:movies/data/api_manger.dart';
import 'package:movies/ui/tabs/home/popularWidget.dart';

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
          FutureBuilder(
              future: ApiManger.getPopular(),
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
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ))));
                }
                bool check = snapshot.data!.results!.length > 5;
                List<Widget> slider = [];
                if (check) {
                  for (int i = 0; i <= 4; i++) {
                    slider.add(PopularWidget(film: snapshot.data!.results![i]));
                  }
                  return ImageSlideshow(
                    children: slider,
                    width: double.infinity,
                    height: 289,
                    isLoop: true,
                    indicatorColor: Colors.transparent,
                    indicatorBackgroundColor: Colors.transparent,
                    autoPlayInterval: 3000,
                  );
                }
                for (int i = 0; i < snapshot.data!.results!.length; i++) {
                  slider.add(PopularWidget(film: snapshot.data!.results![i]));
                }
                return ImageSlideshow(
                  children: slider,
                  width: double.infinity,
                  height: 289,
                  isLoop: true,
                  indicatorColor: Colors.transparent,
                  indicatorBackgroundColor: Colors.transparent,
                  autoPlayInterval: 3000,
                );
              }),
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
