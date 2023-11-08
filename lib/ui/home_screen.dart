import 'package:flutter/material.dart';
import 'package:movies/ui/tabs/browse.dart';
import 'package:movies/ui/tabs/home/home.dart';
import 'package:movies/ui/tabs/search.dart';
import 'package:movies/ui/tabs/watch_list.dart';

class HomeScreen extends StatefulWidget {
  static const String route = "HomeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [Home(), Search(), Browse(), WatchList()];
    const List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: "HOME",
          backgroundColor: Color(0xFF1A1A1A)),
      BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "SEARCH",
          backgroundColor: Color(0xFF1A1A1A)),
      BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          label: "Browse",
          backgroundColor: Color(0xFF1A1A1A)),
      BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: "Watchlist",
          backgroundColor: Color(0xFF1A1A1A)),
    ];
    return Scaffold(
      body: tabs[index],
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: index,
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
      ),
    );
  }
}
