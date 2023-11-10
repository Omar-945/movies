import 'package:flutter/material.dart';
import 'package:movies/ui/filmdetails/film_details.dart';
import 'package:movies/ui/home_screen.dart';
import 'package:movies/ui/tabs/browser/catagory/showCategory.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF1E1E1E),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(
            color: Color(0xFFFFBB3B),
            size: 35,
          ),
          selectedItemColor: Color(0xFFFFBB3B),
          unselectedIconTheme:
              IconThemeData(size: 33, color: Color(0xFFC6C6C6)),
          showUnselectedLabels: true,
        ),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF707070),
            primary: const Color(0xFFFFBB3B),
            secondary: const Color(0xFF282A28),
            onSecondary: const Color(0xFF514F4F),
            background: Color(0xFF343534),
            onPrimary: Color(0xFFB5B4B4)),
        useMaterial3: true,
      ),
      initialRoute: HomeScreen.route,
      routes: {
        HomeScreen.route: (context) => HomeScreen(),
        FilmDetails.route: (context) => FilmDetails(),
        ShowCategory.route: (context) => ShowCategory()
      },
    );
  }
}
