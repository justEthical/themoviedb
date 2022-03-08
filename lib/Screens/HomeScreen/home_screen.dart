import 'package:brewapp/Controller/home_screen_controller.dart';
import 'package:brewapp/Screens/HomeScreen/Widgets/bottom_navbar.dart';
import 'package:brewapp/Screens/HomeScreen/Widgets/now_playing.dart';
import 'package:brewapp/Screens/HomeScreen/Widgets/search_box.dart';
import 'package:brewapp/Screens/HomeScreen/Widgets/top_rated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeScreenController c = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amber,
        child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.amber,
                title: Obx(() => Container(
                    child: c.isSearching.value
                        ? SearchBox()
                        : _staticSearchBox())), //SearchBox(),
                actions: [
                  // Cancel button
                  Obx(() => _cancelButton())
                ],
                elevation: 2,
              ),
              body: TabBarView(
                controller: c.tabController,
                children: [
                  // Now Playing Movie tab
                  Container(
                      color: Colors.amber,
                      child: MovieList(
                        topRated: false,
                        // movieList: c.nowPlayingMovieObsList,
                      )),

                  // Top Rated movie Tab
                  Container(
                    color: Colors.amber,
                    child: TopRated(),
                  ),
                ],
              ),
              bottomNavigationBar: BottomNavBar()),
        ));
  }

  Widget _staticSearchBox() {
    return Center(
      child: GestureDetector(
        onTap: () {
          c.isSearching.value = true;
        },
        child: Container(
          height: 40,
          margin: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: const Center(
              child: Text(
            "search",
            style: TextStyle(color: Colors.grey),
          )),
        ),
      ),
    );
  }

  Widget _cancelButton() {
    return Container(
      child: c.isSearching.value
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  c.isSearching.value = false;
                },
                child: const Center(
                    child: Text(
                  "CANCEL",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
              ))
          : Container(),
    );
  }


}
