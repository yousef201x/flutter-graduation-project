import 'package:injectable/injectable.dart';
import 'package:movies_app_project/features/main_layout/home_tab/data/models/movie_model.dart';
import 'package:movies_app_project/features/main_layout/home_tab/domain/repository/home_repo.dart';

@injectable
class GetMoviesByGenreUseCase {
  HomeRepo homeRepo;

  GetMoviesByGenreUseCase(this.homeRepo);

  Future<MovieResponse> call(String genre) => homeRepo.getMoviesByGenre(genre);
}
