import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/dio_helper.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppIntialStates());

  static AppCubit get(context) => BlocProvider.of(context);

  List<dynamic> moviresid = [];

  void moviesId() {
    emit(AppGetIdMoviesLoadingStates());
    DioHelper.getData(
      url: '3/genre/movie/list',
      query: {
        'api_key': '2001486a0f63e9e4ef9c4da157ef37cd',
      },
    ).then((value) {
      // print(value.data);

      moviresid = value.data['genres'];
      emit(AppGetIdMoviesSucsessStates());
    }).catchError((eroor) {
      print(eroor.toString());
      emit(AppGetIdMoviesErorrStates());
    });
  }

  List<dynamic> movies = [];

  void getMovies({
    required String? page,
  }) {
    emit(AppGetMoviesLoadingStates());
    DioHelper.getData(
      url: '3/discover/movie',
      query: {
        'api_key': '2001486a0f63e9e4ef9c4da157ef37cd',
        'page': '$page',
      },
    ).then((value) {
      movies = value.data['results'];
      emit(AppGetMoviesSucsessStates());
    }).catchError((eroor) {
      print(eroor.toString());
      emit(AppGetMoviesErorrStates());
    });
  }
}
