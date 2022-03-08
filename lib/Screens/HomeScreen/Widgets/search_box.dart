import 'package:brewapp/Controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBox extends StatelessWidget {
  SearchBox({Key? key}) : super(key: key);

  TextEditingController searchQuery = TextEditingController();
  final HomeScreenController c = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
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
