import 'package:flutter/material.dart';

class FilmTag extends StatelessWidget {
  String? type;

  FilmTag({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Color(0xFF514F4F), width: 2)),
      child: Text(
        type ?? "",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}
