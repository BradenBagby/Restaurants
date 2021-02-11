import 'package:flutter/material.dart';
import 'package:flutter_rest/models/restaurant.dart';
import 'package:flutter_rest/services/restaurants_service.dart';
import 'package:flutter_rest/widgets/displays/restaurant.dart';

class RestaurantsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ValueListenableBuilder(
      valueListenable: RestaurantService.instance,
      builder: (context, RestaurantServiceState state, widget) {
        //null means we are loading
        if (state.loading) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemBuilder: (context, index) {
            return RestaurantWidget(state.list[index]);
          },
          itemCount: state.list.length,
        );
      },
    ));
  }
}
