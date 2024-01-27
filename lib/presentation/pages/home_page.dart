import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tes/presentation/bloc/now_playing/now_playing_bloc.dart';
import 'package:movie_tes/presentation/bloc/popular/popular_bloc.dart';
import 'package:movie_tes/presentation/bloc/top_rated/top_rated_bloc.dart';

import '../widgets/widget_movie_home.dart';

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
    context.read<TopRatedBloc>().add(GetTopRatedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const Drawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
        centerTitle: true,
        title: const Text(
          'Movies',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, top: 20),
                child: const Text(
                  'Now Playing Movie',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
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
              Container(
                margin: const EdgeInsets.only(left: 10, top: 20),
                child: const Text(
                  'Popular Movie',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
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
              Container(
                margin: const EdgeInsets.only(left: 10, top: 20),
                child: const Text(
                  'Top Rated Movie',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              BlocBuilder<TopRatedBloc, TopRatedState>(
                builder: (context, state) {
                  if (state is TopRatedLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is TopRatedLoaded) {
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
