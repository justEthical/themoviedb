import 'package:brewapp/Controller/home_screen_controller.dart';
import 'package:brewapp/Screens/HomeScreen/Widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class TopRated extends StatelessWidget {
  TopRated({Key? key}) : super(key: key);

  final HomeScreenController c = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Obx(
          () => c.loading.value
              ? const Center(child: CircularProgressIndicator())
              : LiquidPullToRefresh(
                color: Colors.amber,
                  onRefresh: () async {
                    c.mockApi(c.topRated);
                  },
                  child: ListView.builder(
                      itemCount: c.topRatedMovieObsList.length,
                      itemBuilder: (ctx, i) {
                        var movie = c.topRatedMovieObsList[i];
                        // print(movie.title);
                        return ListItem(
                          movie: movie,
                        );
                      }),
                ),
        ));
  }
}
