import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_rest/models/restaurant.dart';
import 'package:flutter_rest/services/location_service.dart';
import 'package:http/http.dart' as http;

class RestaurantService extends ValueNotifier<RestaurantServiceState> {
  RestaurantService() : super(null);

  static RestaurantService instance = new RestaurantService();

  static const String API_KEY =
      "_dLkmYnAGPOLV3557sQKsXTPtGUPqZGAOSxj4SU4hGKyVjiAWnpLv_kHVGO5iKsR9l5JczfEds7r1uU71BjJy7KZ9FHNx8_N7rX9PSy7QTDLzmM9_f7oAHGdhpipX3Yx";
  static const String CLIENT_ID = "CDdmH-v-4Q9IY3oy6HxcAw";
  static const String BASE_URL = "api.yelp.com";

  static const PAGE_SIZE = 20;

  static RestaurantServiceState _state = new RestaurantServiceState();

  @override
  RestaurantServiceState get value => _state;

////YELP FUSION--------------------------------

//get header for YELP Requests
  Map<String, String> _header() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $API_KEY',
    };
  }

//returns how many restaurants were added
  int fillListWithJson(String jsonString) {
    final Map<String, dynamic> data = json.decode(jsonString);
    List<Map<String, dynamic>> businesses =
        List<Map<String, dynamic>>.from(data["businesses"]);
    for (Map<String, dynamic> business in businesses) {
      _state.list.add(new Restaurant(
          name: business["name"],
          rating: business["rating"],
          image: business["image_url"]));
    }
    return businesses.length;
  }

  Future<void> loadNearby({bool nextPage = false}) async {
    if (nextPage) {
      _state.offset += PAGE_SIZE;
    } else {
      _state.offset = 0;
      _state.list.clear();
    }

    _state.hasMoreToLoad = true;
    _state.loading = true;
    notifyListeners();

    final location = await LocationService.getLocation();

    final params = {
      'latitude': '${location.latitude}',
      'longitude': '${location.longitude}',
      'limit': '$PAGE_SIZE',
      'offset': '${_state.offset}'
    };

    final uri = Uri.https(BASE_URL, '/v3/businesses/search', params);

    final response = await http.get(uri, headers: _header());

    if (response.statusCode == 200) {
      if (fillListWithJson(response.body) < PAGE_SIZE) {
        _state.hasMoreToLoad = false;
      }
    } else {
      _state.hasMoreToLoad = false;
    }

    _state.loading = false;
    notifyListeners();
  }
}

class RestaurantServiceState {
  bool loading = true;
  bool hasMoreToLoad = true;
  int offset = 0;
  List<Restaurant> list = new List<Restaurant>();
}
