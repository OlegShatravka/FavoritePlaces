import 'package:favorite_places/models/favorite_place.dart';
import 'package:favorite_places/pages/create_place_page.dart';
import 'package:favorite_places/widgets/favorite_places_list.dart';
import 'package:flutter/material.dart';

class FavoritePlacesPage extends StatefulWidget {
  const FavoritePlacesPage({Key key}) : super(key: key);

  @override
  _FavoritePlacesPageState createState() => _FavoritePlacesPageState();
}

class _FavoritePlacesPageState extends State<FavoritePlacesPage> {
  final places = <FavoritePlace>[];

  Future _showCreatePlacePage(BuildContext context) async {
    final place = await Navigator.push(
        context,
        MaterialPageRoute<FavoritePlace>(
            builder: (context) => CreatePlacePage()));
    if (place != null) {
      setState(() => places.add(place));
    }
  }

  @override
  Widget build(BuildContext context) {
    //add data to list
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite places'),
      ),
      body: FavoritePlacesList(places: places,),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showCreatePlacePage(context);
        },
      ),
    );
  }
}
