import 'package:favorite_places/pages/favorite_places_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favorite places',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FavoritePlacesPage(),
    );
  }
}
