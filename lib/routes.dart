import 'package:hacker_news/screens/news_details_screen.dart';
import 'package:hacker_news/screens/search_screen.dart';

getRoutes() {
  return {
    SearchScreen.route: (context) => const SearchScreen(),
    NewsDetailsScreen.route: (context) => const NewsDetailsScreen(),
  };
}
