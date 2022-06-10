import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailMovieScreen extends StatelessWidget {
  // const DetailMovieScreen({Key? key}) : super(key: key);

  Map model;

  DetailMovieScreen({required this.model});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff151A30),
        title: Text(
          '${model['original_title']}',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Card(
                  elevation: 5,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.amber,
                    ),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://image.tmdb.org/t/p/w300${model['poster_path']}',
                      fit: BoxFit.fill,
                      height: 350,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff151A30).withOpacity(0.9),
                ),
                child: const Text(
                  'Overview',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white70,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '${model['overview']}',
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
