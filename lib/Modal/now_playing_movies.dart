import 'package:flutter/widgets.dart';

class MoviesData {
  String? title;
  String? description;
  var averageRating;
  String? posterUrl;
  String? releaseDate;
  String? duration;

  MoviesData(
      {@required this.title,
      @required this.description,
      @required this.posterUrl,
      @required this.releaseDate,
      @required this.averageRating,
      this.duration});
  
}
