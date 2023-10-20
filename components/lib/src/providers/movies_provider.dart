import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '';
  String _language = 'es-ES';

  MoviesProvider() {
    print('MoviesProvider inicializado');
    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    _apiKey = dotenv.env['API_MOVIEDB'] ?? '';

    var url = Uri.https(_baseUrl, '/3/movie/now_playing', {
      'language': _language,
      'api_key': _apiKey,
      'page': '1',
    });

    var response = await http.get(url);
    if (response.statusCode != 200) return print('Error: get getOnDisplayMovies');

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
