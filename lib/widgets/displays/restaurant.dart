import 'package:flutter/material.dart';
import 'package:flutter_rest/models/restaurant.dart';

class RestaurantWidget extends StatelessWidget {
  Restaurant restaurant;
  RestaurantWidget(this.restaurant);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        children: [
          Container(
            width: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(restaurant.image), fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [...createStars()],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> createStars() {
    List<Widget> stars = new List<Widget>();
    for (int i = 0; i < restaurant.rating; i++) {
      stars.add(Icon(
        Icons.star,
        color: Colors.black,
      ));
    }
    return stars;
  }
}
