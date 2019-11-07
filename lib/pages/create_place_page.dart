import 'dart:io';
import 'package:favorite_places/models/favorite_place.dart';
import 'package:favorite_places/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePlacePage extends StatefulWidget {
  @override
  _CreatePlacePageState createState() => _CreatePlacePageState();
}

class _CreatePlacePageState extends State<CreatePlacePage> {
  File _photo;
  String _placeName = '';
  String _placeDescription = '';

  Future _getPhoto() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() => _photo = image);
  }

  Future _takePhoto() async {
    final image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() => _photo = image);
  }

  void _save(BuildContext context) {
    if (_photo == null || _placeDescription.isEmpty || _placeName.isEmpty) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: const Text(
              'Photo, place name and place description must be specified.'),
          backgroundColor: Theme.of(context).accentColor,
          duration: Duration(seconds: 3),
        ),
      );
    } else {
      final place = FavoritePlace(_placeName, _placeDescription, _photo);
      Navigator.pop(context, place);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create your favourite place'),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    if (_photo != null) Image.file(_photo),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          child: const Text('Take picture'),
                          onPressed: ()  => _takePhoto(),
                        ),
                        RaisedButton(
                          child: const Text('Take from gallery'),
                          onPressed: () => _getPhoto(),
                        ),
                      ],
                    ),
                    InputField(
                        placeHolder: 'Enter picture name',
                        onPressed: (String text) => _placeName = text),
                    const SizedBox(
                      height: 5,
                    ),
                    InputField(
                        placeHolder: 'Enter description',
                        onPressed: (String text) => _placeDescription = text),
                    RaisedButton(
                      child: const Text('Create'),
                      onPressed: ()  => _save(context),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
