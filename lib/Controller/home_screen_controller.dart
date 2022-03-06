import 'dart:convert';

import 'package:brewapp/Modal/now_playing_movies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  List<MoviesData> movieList = [];
  late TabController tabController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    _mockApi();
  }

  _mockApi() async {
    // print("mockapi is called jljlk;k;k;kllllllllllllllllllllllll");
    var api =
        "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed";

    var response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      print("respsjflllllllllllllllllllllllllllllllllllll");
      var body = jsonDecode(response.body);

      var movies = body["results"];

      for (var movie in movies) {
        var title = movie["original_title"];
        var description = movie["overview"];
        var averageRating = movie["vote_average"];
        var posterUrl =
            "https://image.tmdb.org/t/p/w342" + movie["poster_path"];
        var releaseDate = movie["release_date"];
        var duration = "2hr 30mins";

        var moviesData = MoviesData(
            title: title,
            description: description,
            averageRating: averageRating,
            posterUrl: posterUrl,
            releaseDate: releaseDate,
            duration: duration);
        movieList.add(moviesData);
      }
    }
  }
}
