import 'package:brewapp/Screens/DetailScreen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItem extends StatelessWidget {
  final movie;
  const ListItem({Key? key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: MediaQuery.of(context).size.width,
      // column for movie detail and divider
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(DetailScreen(
                movie: movie,
              ));
            },
            child: Container(
              height: 169,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10.0),
              // Row for poster and title, description
              child: Row(
                children: [
                  // Poster
                  SizedBox(
                      width: 100,
                      height: 149,
                      child: Image.network(
                        movie.posterUrl!,
                        fit: BoxFit.cover,
                      )),
                  // Title and description
                  Container(
                    padding: const EdgeInsets.all(5),
                    height: 149,
                    width: MediaQuery.of(context).size.width - 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // title
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            movie.title!,
                            overflow: TextOverflow.fade,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),

                        // decription
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
          ),
          // devider
          const Divider(
            color: Colors.grey,
            height: 1,
          )
        ],
      ),
    );
  }
}
