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

  var isSearching = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    mockApi(nowPlaying);
    mockApi(topRated);
  }

  // Delete Item in list
  void deleteItem(itemIndex) {
    if (tabController.index == 0) {
      nowPlayingMovieList.remove(itemIndex);
      nowPlayingMovieObsList.remove(itemIndex);
    } else {
      topRatedMovieList.remove(itemIndex);
      topRatedMovieObsList.remove(itemIndex);
    }
  }

  // checking for current tab
  void performingSearch(str) {
    if (tabController.index == 0) {
      nowPlayingSearch(str);
    } else {
      topRatedSearch(str);
    }
  }

  // Calling api
  Future<void> mockApi(api) async {
    if (api == topRated) {
      topRatedMovieList.clear();
      topRatedMovieObsList.clear();
    } else {
      nowPlayingMovieList.clear();
      nowPlayingMovieObsList.clear();
    }
    loading.value = true;

    var response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      print("respsjflllllllllllllllllllllllllllllllllllll");
      var body = jsonDecode(response.body);

      var movies = body["results"];

      for (var movie in movies) {
        var moviesData = _jsonToMovieObject(movie);

        if (api == topRated) {
          topRatedMovieList.add(moviesData);
          topRatedMovieObsList.add(moviesData);
        } else {
          nowPlayingMovieList.add(moviesData);
          nowPlayingMovieObsList.add(moviesData);
        }
      }
    } else {
      print("Something went wrong");
    }
    loading.value = false;
  }

  // converting json data to movie object
  MoviesData _jsonToMovieObject(movie) {
    var title = movie["original_title"];
    var description = movie["overview"];
    var averageRating = movie["vote_average"];
    var posterUrl = "https://image.tmdb.org/t/p/w342" + movie["poster_path"];
    var releaseDate = movie["release_date"];
    var duration = "2hr 30mins";

    var moviesData = MoviesData(
        title: title,
        description: description,
        averageRating: averageRating,
        posterUrl: posterUrl,
        releaseDate: releaseDate,
        duration: duration);
    return moviesData;
  }

  // fuction for performing search in topRated Tab
  void topRatedSearch(query) {
    var movieList = topRatedMovieList;
    topRatedMovieObsList.clear();
    final suggestions = movieList
        .where((p0) {
          final movieTitle = p0.title.toLowerCase();
          final input = query.toLowerCase();

          return movieTitle.contains(input);
        })
        .toList()
        .obs;
    topRatedMovieObsList = suggestions;
  }

  // Function for performing search in now playing Tab
  void nowPlayingSearch(query) {
    var movieList = nowPlayingMovieList;
    nowPlayingMovieObsList.clear();
    final suggestions = movieList
        .where((p0) {
          final movieTitle = p0.title.toLowerCase();
          final input = query.toLowerCase();

          return movieTitle.contains(input);
        })
        .toList()
        .obs;

    nowPlayingMovieObsList = suggestions;
  }
}
