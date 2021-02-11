import 'package:flutter_rest/models/restaurant.dart';

class RestaurantService {
  static const String _API_KEY =
      "_dLkmYnAGPOLV3557sQKsXTPtGUPqZGAOSxj4SU4hGKyVjiAWnpLv_kHVGO5iKsR9l5JczfEds7r1uU71BjJy7KZ9FHNx8_N7rX9PSy7QTDLzmM9_f7oAHGdhpipX3Yx";
  static const String _CLIENT_ID = "CDdmH-v-4Q9IY3oy6HxcAw";

  static List<Restaurant> tests = [
    new Restaurant(
        name: "Canes Chicken",
        rating: 5,
        image:
            "https://cdn.vox-cdn.com/thumbor/Mt5RL1j9UHDzwG4DGD7DvCIsnE4=/1400x1050/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/20006954/raising_canes_1.jpeg"),
    new Restaurant(
        name: "Jack in the Box",
        rating: 3,
        image:
            "https://s3-prod.adage.com/s3fs-public/styles/width_1024/public/jackinthebox_teriyakibowls.jpg"),
    new Restaurant(
        name: "Texas Roadhouse",
        rating: 4,
        image:
            "https://www.fsrmagazine.com/sites/default/files/styles/story_image_720x430/public/2020-02/TexasRoadhouseEXT.jpg?itok=nd37u-7e"),
  ];
}
