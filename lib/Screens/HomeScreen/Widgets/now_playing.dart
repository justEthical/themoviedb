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

  _listItem(movie, context) {
    return SizedBox(
      height: 170,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            height: 169,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                SizedBox(
                    width: 100,
                    height: 149,
                    child: Image.network(
                      movie.posterUrl!,
                      fit: BoxFit.cover,
                    )),
                Container(
                  padding: const EdgeInsets.all(5),
                  height: 149,
                  width: MediaQuery.of(context).size.width - 140,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        movie.title!,
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          movie.description!,
                          overflow: TextOverflow.fade,
                        ),
                      ))
                    ],
                  ),
                )
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
            height: 1,
          )
        ],
      ),
    );
  }
}
