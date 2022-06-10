import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/app_cubit.dart';
import 'cubit/app_states.dart';
import 'detail_movie_screen.dart';
import 'drawer_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        //  var rate = cubit.movies[0]['vote_average'];
        //   print(rate);

        //  print(cubit.movies[0]['original_title']);
        return Scaffold(
            backgroundColor: const Color(0xff151A30),
            drawer: const AppDrawer(),
            appBar: AppBar(
              title: const Text(
                'Movies',
              ),
              backgroundColor: const Color(0xff151A30),
            ),
            body: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildMovieItem(
                cubit.movies[index],
                index,
                context,
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 2),
              itemCount: cubit.movies.length,
            ));
      },
    );
  }

  Widget buildMovieItem(Map movies, index, context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailMovieScreen(model: movies),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),

                    // image: DecorationImage(
                    //   fit: BoxFit.cover,
                    //   image: CachedNetworkImage(imageUrl: 'imageUrl'),
                    //   // image: NetworkImage(
                    //   //   'https://img.freepik.com/free-photo/man-watching-streaming-service-his-tv_23-2149047410.jpg?t=st=1654484366~exp=1654484966~hmac=b3de93c603efdc491a13f497429ec14cc4e8febe16ba06a9453372c95174111e&w=996',
                    //   // ),
                    // ),
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://image.tmdb.org/t/p/w300${movies['poster_path']}',
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: 250,
                  ),
                ),
                Container(
                  height: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(
                            width: 55,
                            height: 25,
                            margin: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black45,
                            ),
                          ),
                          Container(
                            width: 55,
                            height: 25,
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Color(0xffDAC82B),
                                ),
                                Spacer(),
                                Text(
                                  '${movies['vote_average']}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          color: Colors.black54,
                          alignment: Alignment.center,
                          child: Text(
                            '${movies['title']} ',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
