import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_tes/presentation/bloc/detail/detail_bloc.dart';
import 'package:movie_tes/presentation/bloc/now_playing/now_playing_bloc.dart';
import 'package:movie_tes/presentation/bloc/popular/popular_bloc.dart';
import 'package:movie_tes/presentation/bloc/top_rated/top_rated_bloc.dart';
import 'package:movie_tes/presentation/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NowPlayingBloc>(
          create: (context) => NowPlayingBloc(),
        ),
        BlocProvider<PopularBloc>(
          create: (context) => PopularBloc(),
        ),
        BlocProvider<TopRatedBloc>(
          create: (context) => TopRatedBloc(),
        ),
        BlocProvider<DetailBloc>(
          create: (context) => DetailBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            textTheme:
                GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
        title: 'Movie & Tv',
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
