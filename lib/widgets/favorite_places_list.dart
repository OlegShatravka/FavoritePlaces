import 'package:favorite_places/models/favorite_place.dart';
import 'package:favorite_places/widgets/place_tile.dart';
import 'package:flutter/material.dart';

class FavoritePlacesList extends StatelessWidget {
  const FavoritePlacesList({this.places});
  final List<FavoritePlace> places;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: places.isEmpty
          ? Center(
              child: const Text('Press + button to add a new place.'),
            )
          : ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                return PlaceTile(place: places[index]);
              },
            ),
    );
  }
}