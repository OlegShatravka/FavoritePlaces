import 'package:favorite_places/models/favorite_place.dart';
import 'package:favorite_places/pages/create_place_page.dart';
import 'package:favorite_places/widgets/place_tile.dart';
import 'package:flutter/material.dart';

class FavoritePlacesPage extends StatefulWidget {
  const FavoritePlacesPage({Key key}) : super(key: key);

  @override
  _FavoritePlacesPageState createState() => _FavoritePlacesPageState();
}

class _FavoritePlacesPageState extends State<FavoritePlacesPage> {
  final places = <FavoritePlace>[];

  Future _showCreatePlace(BuildContext context) async {
    final place = await Navigator.push(
        context,
        MaterialPageRoute<FavoritePlace>(
            builder: (context) => CreatePlacePage()));
    if (place != null) {
      setState(() {
        places.add(place);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //add data to list
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite places'),
      ),
      body: places.isEmpty
          ? Center(
              child: const Text('Press + button to add a new place.'),
            )
          : ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                return PlaceTile(place: places[index]);
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showCreatePlace(context);
        },
      ),
    );
  }
}
