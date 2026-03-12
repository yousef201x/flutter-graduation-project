import 'package:movies_app_project/features/main_layout/home_tab/data/models/movie_model.dart';

abstract class BrowseDs {
  Future<MovieResponse> browseMovies(String genre);
}
