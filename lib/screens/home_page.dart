import 'package:app_ola/model/photos_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'widgets/top_bar.dart';
import 'package:app_ola/env/keys.dart' as config;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PhotosModel> _photosData = [];

  Future<void> _fetchPhotos() async {
    final _dioInstance = Dio();

    _dioInstance.options.headers['Authorization'] =
        "Client-ID ${config.unsplashKey}";

    final _fetchData =
        await _dioInstance.get('https://api.unsplash.com/photos');

    for (var _items in _fetchData.data) {
      setState(() {
        _photosData.add(
            PhotosModel(id: _items['id'], imgURL: _items['urls']['regular']));
      });
    }
    print('object');
  }

  @override
  void initState() {
    _fetchPhotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBar(
            title: 'Arun P Madhu',
            subtitle: 'Aspiring Developer',
            color: Color(0xff993333),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Unsplash Photos',
            style: TextStyle(fontSize: 22, color: Colors.brown),
          ),
          const SizedBox(
            height: 10,
          ),
          GridView.builder(
            padding: EdgeInsets.all(10),
            itemCount: _photosData.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10, crossAxisSpacing: 10, crossAxisCount: 2),
            itemBuilder: (ctx, index) => Container(
              child: Image.network(
                _photosData[index].imgURL,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    )));
  }
}
