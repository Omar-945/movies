import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:movies/ui/tabs/home/popular/popularWidget.dart';
import 'package:movies/ui/tabs/home/popular/popular_view_model.dart';

class Popular extends StatefulWidget {
  Popular({super.key});

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  var popularViewModel = PopularViewModel();

  @override
  void initState() {
    super.initState();
    popularViewModel.getPopularFilms();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularViewModel, PopularStates>(
      bloc: popularViewModel,
      builder: (context, state) {
        switch (state) {
          case Loading():
            {
              return const SafeArea(
                  child: Padding(
                padding: EdgeInsets.all(20),
                child: Center(child: CircularProgressIndicator()),
              ));
            }

          case Success():
            {
              bool check = state.films.length > 5;
              List<Widget> slider = [];
              if (check) {
                for (int i = 0; i <= 4; i++) {
                  slider.add(PopularWidget(film: state.films[i]));
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
              for (int i = 0; i < state.films.length; i++) {
                slider.add(PopularWidget(film: state.films[i]));
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
          case Error():
            {
              return SafeArea(
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Center(
                          child: Text(
                        state.error,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ))));
            }
        }
      },
    );
  }
}
