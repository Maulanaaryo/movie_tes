import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:movie_tes/data/models/movie_detail_model.dart';
import 'package:movie_tes/data/models/movie_model.dart';

import '../../utils/constants.dart';

class MovieDataSource {
  Future<Either<String, List<MovieModel>>> getNowPlaying() async {
    final response =
        await http.get(Uri.parse('$baseUrl/movie/now_playing?$apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedData = json.decode(response.body);

      if (decodedData.containsKey('results')) {
        final List<MovieModel> movies = (decodedData['results'] as List)
            .map((data) => MovieModel.fromMap(data))
            .toList();
        return right(movies);
      } else {
        throw Exception('Results key not found in the API response');
      }
    } else {
      throw Exception(
          'Failed to fetch now playing movies. Status code: ${response.statusCode}');
    }
  }

  Future<Either<String, List<MovieModel>>> getPopular() async {
    final response =
        await http.get(Uri.parse('$baseUrl/movie/popular?$apiKey'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedData = json.decode(response.body);

      if (decodedData.containsKey('results')) {
        final List<MovieModel> movies = (decodedData['results'] as List)
            .map((data) => MovieModel.fromMap(data))
            .toList();
        return right(movies);
      } else {
        throw Exception('Results key not found in the API response');
      }
    } else {
      throw Exception(
          'Failed to fetch popular movies. Status code: ${response.statusCode}');
    }
  }

  Future<Either<String, List<MovieModel>>> getTopRated() async {
    final response =
        await http.get(Uri.parse('$baseUrl/movie/top_rated?$apiKey'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedData = json.decode(response.body);

      if (decodedData.containsKey('results')) {
        final List<MovieModel> movies = (decodedData['results'] as List)
            .map((data) => MovieModel.fromMap(data))
            .toList();
        return right(movies);
      } else {
        throw Exception('Results key not found in the API response');
      }
    } else {
      throw Exception(
          'Failed to fetch top rated movies. Status code: ${response.statusCode}');
    }
  }

  Future<Either<String, MovieDetailModel>> getMovieDetail(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/movie/$id?$apiKey'));

    if (response.statusCode == 200) {
      final movieDetail = MovieDetailModel.fromJson(json.decode(response.body));
      return right(movieDetail);
    } else {
      throw Exception(
          'Failed to fetch detail movies. Status code: ${response.statusCode}');
    }
  }
}
