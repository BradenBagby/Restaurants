import 'package:flutter/material.dart';
import 'package:flutter_rest/services/restaurants_service.dart';
import 'package:flutter_rest/widgets/displays/restaurant.dart';

class RestaurantsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return RestaurantWidget(RestaurantService.tests[index]);
        },
        itemCount: RestaurantService.tests.length,
      ),
    );
  }
}
