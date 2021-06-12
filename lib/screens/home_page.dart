import 'package:app_ola/screens/widgets/photo_grid.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'profile_page.dart';
import 'widgets/top_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _profileEdit() {
    Navigator.of(context)
        .pushNamed(ProfileScreen.routeName, arguments: "Arun")
        .then((value) => print('object $value'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            profileTab(),
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
            PhotoGrid()
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: _profileEdit, child: Icon(Icons.edit)),
    );
  }

  ValueListenableBuilder<Box<dynamic>> profileTab() {
    return ValueListenableBuilder(
      valueListenable: Hive.box('profile').listenable(),
      builder: (BuildContext context, Box value, Widget? child) => TopBar(
        title: value.get('name'),
        subtitle: 'Aspiring Developer',
        color: Color(0xff993333),
      ),
    );
  }
}
