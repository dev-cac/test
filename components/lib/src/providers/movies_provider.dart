import 'package:components/src/models/now_playing_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = dotenv.env['API_MOVIEDB'] ?? '';
  final String _language = 'es-ES';

  MoviesProvider() {
    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/now_playing', {
      'language': _language,
      'api_key': _apiKey,
      'page': '1',
    });

    var response = await http.get(url);
    if (response.statusCode != 200) return print('Error: get getOnDisplayMovies');

    final res = NowPlayingResponse.fromRawJson(response.body);
    print(res.results[0].title);
  }
}
