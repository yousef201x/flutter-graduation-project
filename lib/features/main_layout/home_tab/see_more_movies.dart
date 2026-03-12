import 'package:flutter/material.dart';
import 'package:movies_app_project/core/widgets/custom_grid_view.dart';
import 'package:movies_app_project/features/main_layout/home_tab/data/models/movie_model.dart';
import 'package:movies_app_project/utils/app_colors.dart';

class SeeMoreMovies extends StatelessWidget {
  final List<Movies> movies;
  const SeeMoreMovies({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomGridView(movies: movies),
          )
      ),
    );
  }
}
