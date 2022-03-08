import 'dart:collection';
import 'dart:convert';

import 'package:brewapp/Modal/now_playing_movies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var nowPlayingMovieList = [];
  var topRatedMovieList = [];
  late TabController tabController;
  var nowPlayingMovieObsList = [].obs;
  var topRatedMovieObsList = [].obs;
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
          topRatedMovieList.add(moviesData);
          topRatedMovieObsList.add(moviesData);
        } else {
          nowPlayingMovieList.add(moviesData);
          nowPlayingMovieObsList.add(moviesData);
        }
      }
    }
    loading.value = false;
  }

  topRatedSearch(query) {
    var movieList = topRatedMovieList;
    print(topRatedMovieObsList.length);
    topRatedMovieObsList.clear();
    final suggestions = movieList
        .where((p0) {
          final movieTitle = p0.title.toLowerCase();
          final input = query.toLowerCase();

          return movieTitle.contains(input);
        })
        .toList()
        .obs;
    // print(suggestions.length);

    topRatedMovieObsList = suggestions;
    print(nowPlayingMovieObsList.length);
    print("this is top rated");
  }

  nowPlayingSearch(query) {
    var movieList = nowPlayingMovieList;
    print(nowPlayingMovieObsList.length);
    nowPlayingMovieObsList.clear();
    final suggestions = movieList
        .where((p0) {
          final movieTitle = p0.title.toLowerCase();
          final input = query.toLowerCase();

          return movieTitle.contains(input);
        })
        .toList()
        .obs;
    // print(suggestions.length);

    nowPlayingMovieObsList = suggestions;
    print(nowPlayingMovieObsList.length);
    print("this is now playing");
  }

  void search(
    String query,

  ) {
    // var movieList =
    //     tabController.index == 0 ? nowPlayingMovieList : topRatedMovieList;
    var movieList = nowPlayingMovieList;
    print(nowPlayingMovieObsList.length);
    nowPlayingMovieObsList.clear();
    final suggestions = movieList
        .where((p0) {
          final movieTitle = p0.title.toLowerCase();
          final input = query.toLowerCase();

          return movieTitle.contains(input);
        })
        .toList()
        .obs;
    // print(suggestions.length);

    nowPlayingMovieObsList = suggestions;
    print(nowPlayingMovieObsList.length);
  }
}
