import 'package:flutter/material.dart';

import 'widgets/top_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopBar(
          title: 'Naruto World',
          subtitle: 'Visual Jutsu',
          color: Color(0xff993333),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Types of Sharingan',
          style: TextStyle(fontSize: 22, color: Colors.brown),
        )
      ],
    )));
  }
}
