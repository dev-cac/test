import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:components/src/models/movie.dart';
import 'package:components/src/models/now_playing_response.dart';
import 'package:components/src/models/popular_response.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = dotenv.env['API_MOVIEDB'] ?? '';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  int _popularPage = 0;

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  httpGet({ String endpoint = '', int page = 1 }) async {
    var url = Uri.https(_baseUrl, endpoint, {
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
}
