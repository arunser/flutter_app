import 'package:app_ola/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'env/hiveInit.dart';
import 'screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await hiveInit();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {ProfileScreen.routeName: (ctx) => ProfileScreen()},
      home: HomePage(),
    );
  }
}
