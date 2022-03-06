import 'package:brewapp/Controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieList extends StatelessWidget {
  MovieList({Key? key}) : super(key: key);

  final HomeScreenController c = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
          itemCount: c.movieList.length,
          itemBuilder: (ctx, i) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      SizedBox(
                          // width: 150,
                          height: 120,
                          child: Image.network(c.movieList[i].posterUrl!)),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(c.movieList[i].title!, overflow: TextOverflow.fade,),
                          
                            // Text(c.movieList[i].description!, overflow: TextOverflow.fade,)
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
            );
          }),
    );
  }
}
