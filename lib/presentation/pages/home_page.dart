import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tes/data/models/movie_model.dart';
import 'package:movie_tes/presentation/bloc/now_playing/now_playing_bloc.dart';
import 'package:movie_tes/presentation/bloc/popular/popular_bloc.dart';
import 'package:movie_tes/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<NowPlayingBloc>().add(GetNowPlayingEvent());
    context.read<PopularBloc>().add(GetPopularEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Text('Now Playing Movie'),
              BlocBuilder<NowPlayingBloc, NowPlayingState>(
                builder: (context, state) {
                  if (state is NowPlayingLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is NowPlayingLoaded) {
                    final result = state.movie;
                    return MovieList(result);
                  } else {
                    return const Text('Error Nich');
                  }
                },
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text('Popular Movie'),
              BlocBuilder<PopularBloc, PopularState>(
                builder: (context, state) {
                  if (state is PopularLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is PopularLoaded) {
                    final result = state.movie;
                    return MovieList(result);
                  } else {
                    return const Text('Error Nich');
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MovieList extends StatelessWidget {
  final List<MovieModel> movies;

  const MovieList(this.movies, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {},
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$baseImageUrl${movie.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) {
                    return const Icon(Icons.error);
                  },
                ),
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}
