import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category {
  static const String sportId = "sports";
  static const String movieId = "movies";
  static const String musicId = "music";

  String id;

  late String title;
  late IconData icon;

  Category({required this.id, required this.title, required this.icon});

  Category.fromId(this.id) {
    if (id == sportId) {
      title = "sports";
      icon = Icons.sports_baseball_outlined;
    } else if (id == movieId) {
      title = "Movie";
      icon = Icons.movie;
    } else if (id == musicId) {
      title = "Music";
      icon = Icons.music_note;
    }
  }

  static List<Category> getCategory() {
    return [
      Category.fromId(sportId),
      Category.fromId(musicId),
      Category.fromId(movieId),
    ];
  }
}
