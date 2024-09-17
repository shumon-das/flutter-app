import '../pages/home/categories/aphorism.dart';
import '../pages/home/categories/jokes.dart';
import '../pages/home/categories/natok.dart';
import '../pages/home/categories/novel.dart';
import '../pages/home/categories/poem.dart';
import '../pages/home/categories/songs.dart';
import '../pages/home/categories/stories.dart';
import '../pages/home/categories/thesis.dart';

class HomeData {
  static List homePages = [
    {'title': 'গল্প', 'page': const Stories()},
    {'title': 'কবিতা', 'page': const Poem()},
    {'title': 'কৌতুক', 'page': const Jokes()},
    {'title': 'প্রবন্ধ', 'page': const Thesis()},
    {'title': 'উপন্যাস', 'page': const Novel()},
    {'title': 'উক্তি', 'page': const Aphorism()},
    {'title': 'নাটক', 'page': const Natok()},
    {'title': 'গান', 'page': const Songs()},
  ];
}