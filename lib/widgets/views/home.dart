import 'package:flutter/material.dart';
import 'package:flutter_rest/widgets/views/restaurants_list.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurants"),
      ),
      body: RestaurantsListWidget(),
    );
  }
}
