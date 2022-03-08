import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final movie;
  const DetailScreen({Key? key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
        ),
        body: Stack(
          children: [
            // Container for Background Image
            Container(
              height: double.infinity,
              width: MediaQuery.of(context).size.width,
              color: Colors.amber,
              child: Image.network(
                movie.posterUrl,
                fit: BoxFit.cover,
              ),
            ),

            // For Movie details black transparent card
            Positioned(
              bottom: 50,
              left: 20,
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 300,
                color: Colors.black.withOpacity(0.5),
                child: _details(),
              ),
            )
          ],
        ));
  }

  Widget _details() {
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
          const SizedBox(height: 10,),

          //Release Date Text
          Text(
            movie.releaseDate,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),

          const SizedBox(height: 10,),

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
                  const SizedBox(width: 10,),
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
              const SizedBox(width: 10,),
              Text(
                "${movie.duration}",
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              ],)
            ],
          ),

          const SizedBox(height: 10,),

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
