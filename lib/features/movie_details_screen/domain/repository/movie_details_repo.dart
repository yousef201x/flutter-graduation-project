import 'package:movies_app_project/features/main_layout/home_tab/data/models/movie_model.dart';
import 'package:movies_app_project/features/movie_details_screen/data/models/movie_details_model.dart';

abstract class MovieDetailsRepo {
  Future<MovieDetailsResponse> getMovieDetails(String id);
  Future<MovieResponse> getMoviesSuggestion(String id);
}
