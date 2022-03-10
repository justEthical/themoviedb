import 'package:brewapp/Controller/home_screen_controller.dart';
import 'package:brewapp/Screens/HomeScreen/Widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class MovieList extends StatelessWidget {
  final topRated;
  final movieList;
  MovieList({Key? key, this.topRated, this.movieList})
      : super(
          key: key,
        );

  final HomeScreenController c = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    // var movieList = c.tabController.index == 0
    //     ? c.nowPlayingMovieObsList
    //     : c.topRatedMovieObsList;
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Obx(
          () => c.loading.value
              ? const Center(child: CircularProgressIndicator())
              : LiquidPullToRefresh(
                // backgroundColor: Colors.amber,
                color: Colors.amber,
                  onRefresh: () async {
                    c.mockApi(c.nowPlaying);
                  },
                  child: ListView.builder(
                      itemCount: c.nowPlayingMovieObsList.length,
                      itemBuilder: (ctx, i) {
                        var movie = c.nowPlayingMovieObsList[i];
                        return ListItem(
                          movie: movie,
                        );
                      }),
                ),
        ));
  }

    
}
