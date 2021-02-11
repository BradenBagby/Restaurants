import 'package:flutter/material.dart';
import 'package:flutter_rest/models/restaurant.dart';

class RestaurantWidget extends StatelessWidget {
  Restaurant restaurant;
  RestaurantWidget(this.restaurant);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
      height: 120,
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.white.withAlpha(30),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: restaurant.image.isNotEmpty
                      ? DecorationImage(
                          image: NetworkImage(restaurant.image),
                          fit: BoxFit.cover)
                      : null),
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
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    maxLines: 2,
                  ),
                  Row(
                    children: [...createStars()],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> createStars() {
    List<Widget> stars = new List<Widget>();
    for (int i = 0; i < restaurant.rating; i++) {
      stars.add(Icon(
        Icons.star,
        color: Colors.yellow,
      ));
    }
    return stars;
  }
}
