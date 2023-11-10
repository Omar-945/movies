import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ui/tabs/browser/browser_view_model.dart';
import 'package:movies/ui/tabs/browser/film_type.dart';

class FilmCategoryBuilder extends StatefulWidget {
  const FilmCategoryBuilder({super.key});

  @override
  State<FilmCategoryBuilder> createState() => _FilmCategoryBuilderState();
}

class _FilmCategoryBuilderState extends State<FilmCategoryBuilder> {
  BrowserViewModel browserViewModel = BrowserViewModel();

  @override
  void initState() {
    super.initState();
    browserViewModel.getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrowserViewModel, BrowserState>(
        bloc: browserViewModel,
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
            case Success():
              {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 38,
                    mainAxisSpacing: 47,
                  ),
                  itemBuilder: (context, index) {
                    return FilmType(
                      index: index,
                      genres: state.types[index],
                    );
                  },
                  itemCount: state.types.length,
                );
              }
          }
        });
  }
}
