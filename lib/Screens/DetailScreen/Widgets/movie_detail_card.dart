import 'package:flutter/material.dart';

class MovieDetailCard extends StatelessWidget {
  final movie;
  const MovieDetailCard({Key? key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title text
          Text(
            movie.title,
            style: const TextStyle(color: Colors.white, fontSize: 30),
          ),
          const SizedBox(
            height: 10,
          ),

          //Release Date Text
          Text(
            movie.releaseDate,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),

          const SizedBox(
            height: 10,
          ),

          // Row for Rating and timing
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Row for Rating
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.rate_review,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${movie.averageRating}",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),

              // Row for movie duration
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.alarm,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${movie.duration}",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              )
            ],
          ),

          const SizedBox(
            height: 10,
          ),

          // Scrollable description
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                movie.description,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
