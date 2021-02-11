import 'package:flutter/material.dart';
import 'package:flutter_rest/services/location_service.dart';
import 'package:flutter_rest/services/restaurants_service.dart';
import 'package:flutter_rest/widgets/views/restaurants_list.dart';

class Home extends StatelessWidget {
  Home() {
    //load nearby restaurants initially
    RestaurantService.instance.loadNearby();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurants"),
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                RestaurantService.instance.loadNearby();
              })
        ],
      ),
      body: RestaurantsListWidget(),
    );
  }
}
