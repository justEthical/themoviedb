import 'package:brewapp/Controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieList extends StatelessWidget {
  MovieList({Key? key}) : super(key: key);

  final HomeScreenController c = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Obx(
          () => c.loading.value
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: c.movieList.length,
                  itemBuilder: (ctx, i) {
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
                                      c.movieList[i].posterUrl!,
                                      fit: BoxFit.cover,
                                    )),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  height: 149,
                                  width:
                                      MediaQuery.of(context).size.width - 140,
                                  child: Column(
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        c.movieList[i].title!,
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
                                          c.movieList[i].description!,
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
                  }),
        ));
  }
}
