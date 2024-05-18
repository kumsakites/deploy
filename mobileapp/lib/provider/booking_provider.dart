import 'package:flutter/material.dart';

class MovieDetails extends ChangeNotifier {
  String title = '';
  String imageUrl = '';
  double rating = 0.0;

  void setDetails(String title, String imageUrl, double rating) {
    this.title = title;
    this.imageUrl = imageUrl;
    this.rating = rating;
    notifyListeners();
  }
}

class BookingProvider with ChangeNotifier {
  MovieDetails _selectedMovie = MovieDetails();
  MovieDetails get selectedMovie => _selectedMovie;

  // Add a getter for selectedMovieImage
  String get selectedMovieImage => _selectedMovie.imageUrl;

  void setSelectedMovie(String title, String imageUrl, double rating) {
    _selectedMovie.setDetails(title, imageUrl, rating);
    notifyListeners();
  }
}
