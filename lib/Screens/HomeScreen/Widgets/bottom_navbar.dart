import 'package:brewapp/Controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key? key}) : super(key: key);

    final HomeScreenController c = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                                icon: const Icon(Icons.movie, size: 35)),
                           const Text(
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
                                icon: const Icon(Icons.star, size: 35)),
                            const Text(
                              "Top Rated",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }
}
