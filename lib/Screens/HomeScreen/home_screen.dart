import 'package:brewapp/Controller/home_screen_controller.dart';
import 'package:brewapp/Screens/HomeScreen/Widgets/now_playing.dart';
import 'package:brewapp/Screens/HomeScreen/Widgets/top_rated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeScreenController c = Get.put(HomeScreenController());

  TextEditingController searchQuery = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amber,
        child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.amber,
                title: _searchBox(),
                actions: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: const Center(
                            child: Text(
                          "CANCEL",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                      ))
                ],
                elevation: 2,
              ),
              body: TabBarView(
                controller: c.tabController,
                children: [
                  Container(
                      color: Colors.amber,
                      child: MovieList(
                        topRated: false,
                        // movieList: c.nowPlayingMovieObsList,
                      )),
                  Container(
                    color: Colors.amber,
                    child: TopRated(),
                    // topRated: true,
                    // movieList: c.topRatedMovieObsList,
                  ),
                ],
              ),
              bottomNavigationBar: Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Center(
                        child: Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  c.tabController.animateTo(0);
                                },
                                icon: Icon(Icons.movie, size: 35)),
                            Text(
                              "Now Playing",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Center(
                        child: Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  c.tabController.animateTo(1);
                                },
                                icon: Icon(Icons.star, size: 35)),
                            Text(
                              "Top Rated",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }

  _searchBox() {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: TextField(
        onChanged: (str) {
          c.performingSearch(str);
          // c.search(str);
          print(str);
        },
        controller: searchQuery,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: const Icon(
            Icons.search,
            size: 20,
            color: Colors.black26,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              searchQuery.clear();
              c.performingSearch("");
            },
            child: const Icon(
              Icons.close,
              size: 18,
              color: Colors.black26,
            ),
          ),
          hintText: "Search",
        ),
      ),
    );
  }
}
