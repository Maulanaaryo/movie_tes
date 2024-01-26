import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:movie_tes/data/models/movie_model.dart';

class HomeDataSource {
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = 'api_key=2174d146bb9c0eab47529b2e77d6b526';

  Future<Either<String, List<MovieModel>>> getNowPlaying() async {
    try {
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
    } catch (e) {
      return left('An error occurred: $e');
    }
  }

  Future<Either<String, List<MovieModel>>> getPopular() async {
    try {
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
            'Failed to fetch now playing movies. Status code: ${response.statusCode}');
      }
    } catch (e) {
      return left('An error occurred: $e');
    }
  }
}
