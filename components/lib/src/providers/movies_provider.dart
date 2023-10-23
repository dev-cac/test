import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:components/src/models/movie.dart';
import 'package:components/src/models/now_playing_response.dart';
import 'package:components/src/models/credits_response.dart';
import 'package:components/src/models/popular_response.dart';
import 'package:components/src/models/movies_response.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = dotenv.env['API_MOVIEDB'] ?? '';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  Map<int, List<Cast>> castMovies = {};

  int _popularPage = 0;

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  httpGet({ String endpoint = '', int page = 1 }) async {
    final url = Uri.https(_baseUrl, endpoint, {
      'language': _language,
      'api_key': _apiKey,
      'page': '$page',
    });

    return await http.get(url);
  }

  getOnDisplayMovies() async {
    var res = await httpGet(endpoint: '/3/movie/now_playing');
    if (res.statusCode != 200) return print('Error: get getOnDisplayMovies');

    final data = NowPlayingResponse.fromRawJson(res.body);
    onDisplayMovies = data.results;
    notifyListeners();
  }

  getPopularMovies() async  {
    _popularPage++;

    var res = await httpGet(endpoint: '/3/movie/popular', page: _popularPage);
    if (res.statusCode != 200) return print('Error: get getPopularMovies');

    final data = PopularResponse.fromRawJson(res.body);
    popularMovies = [ ...popularMovies, ...data.results];
    notifyListeners();
  }

  Future <List<Cast>> getCastMovie(movieId) async {
    if (castMovies.containsKey(movieId)) return castMovies[movieId]!;

    var res = await httpGet(endpoint: '/3/movie/$movieId/credits', page: 1);
    if (res.statusCode != 200) {
      print('Error: get getPopularMovies');
    }

    final data = CreditResponse.fromRawJson(res.body);
    castMovies[movieId] = data.cast;
    return data.cast;
  }

  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.https(_baseUrl, '3/search/movie', {
      'language': _language,
      'api_key': _apiKey,
      'query': query
    });

    final res = await http.get(url);
    if (res.statusCode != 200) {
      print('Error: get getPopularMovies');
    }

    final data = MoviesResponse.fromRawJson(res.body);
    return data.results;
  }
}
