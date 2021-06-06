import 'package:flutter/material.dart';

import 'widgets/top_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
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
          ),
          const SizedBox(
            height: 10,
          ),
          GridView.builder(
            padding: EdgeInsets.all(10),
            itemCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10, crossAxisSpacing: 10, crossAxisCount: 2),
            itemBuilder: (ctx, index) => Container(
              child: Image.network(
                'https://4.bp.blogspot.com/-Gt1kbinvp6s/WEa2dOsVUpI/AAAAAAAAJTo/0jzG9wH4Zm0UPKhsPKPGptsOm63grCU0ACLcB/s1600/6%2BNon-Uchiha%2BTo%2BHave%2BWielded%2BA%2BSharingan.png',
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    )));
  }
}
