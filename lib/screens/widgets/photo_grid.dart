import 'package:app_ola/core/controller/api.dart';
import 'package:app_ola/model/photos_model.dart';
import 'package:flutter/material.dart';
import 'photo_tile.dart';

class PhotoGrid extends StatefulWidget {
  @override
  _PhotoGridState createState() => _PhotoGridState();
}

class _PhotoGridState extends State<PhotoGrid> {
  List<PhotosModel> _photosData = [];

  Future<void> _fetchPhotos() async {
    PhotosApi _photosApi = PhotosApi();
    List<PhotosModel> _tempPhotosData =
        await _photosApi.fetchPhotos().catchError((err) => print(err));

    setState(() => _photosData = _tempPhotosData);
  }

  @override
  void initState() {
    _fetchPhotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: _photosData.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10, crossAxisSpacing: 10, crossAxisCount: 2),
      itemBuilder: (ctx, index) => PhotoTile(url: _photosData[index].imgURL),
    );
  }
}
