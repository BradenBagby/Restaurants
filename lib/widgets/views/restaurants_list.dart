import 'dart:developer';

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
        return NotificationListener<ScrollNotification>(
          onNotification: (scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent &&
                state.hasMoreToLoad) {
              loadMore();
            }
          },
          child: ListView.builder(
            itemBuilder: (context, index) {
              return index < state.list.length
                  ? RestaurantWidget(state.list[index])
                  : Container(
                      height: 50,
                      width: 50,
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                          child: state.loading
                              ? CircularProgressIndicator()
                              : Text(
                                  "More",
                                  style: TextStyle(color: Colors.white),
                                )));
            },
            itemCount: state.list.length +
                (state.loading || state.hasMoreToLoad ? 1 : 0),
          ),
        );
      },
    ));
  }

  void loadMore() {
    RestaurantService.instance.loadNearby(nextPage: true);
  }
}
