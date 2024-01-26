import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tes/presentation/bloc/now_playing/now_playing_bloc.dart';
import 'package:movie_tes/presentation/bloc/popular/popular_bloc.dart';
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
        )
      ],
      child: const MaterialApp(
        title: 'Movie & Tv',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
