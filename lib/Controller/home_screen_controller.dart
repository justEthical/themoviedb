import 'dart:convert';

import 'package:brewapp/Modal/now_playing_movies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var movieList = [].obs;
  var topMovieList = [].obs;
  late TabController tabController;
  var loading = false.obs;
  String nowPlaying =
      "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed";
  String topRated =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    _mockApi(nowPlaying);
    _mockApi(topRated);
  }

  _mockApi(api) async {
    // print("mockapi is called jljlk;k;k;kllllllllllllllllllllllll");
    loading.value = true;

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
        if (api == topRated) {
          topMovieList.add(moviesData);
        } else {
          movieList.add(moviesData);
        }
      }
    }
    loading.value = false;
  }
}
