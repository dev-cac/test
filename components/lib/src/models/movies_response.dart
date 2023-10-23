import 'dart:convert';
import 'package:components/src/models/movie.dart';

class MoviesResponse {
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  MoviesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MoviesResponse.fromRawJson(String str) => MoviesResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MoviesResponse.fromJson(Map<String, dynamic> json) => MoviesResponse(
    page: json["page"],
    results: List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}
