import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hacker_news/providers/news_details_provider.dart';
import 'package:hacker_news/providers/search_news_provider.dart';
import 'package:hacker_news/routes.dart';
import 'package:hacker_news/screens/search_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: SearchNewsProvider()),
        ChangeNotifierProvider.value(value: NewsDetailsProvider()),
      ],
      child: MaterialApp(
        title: 'Hacker News',
        initialRoute: SearchScreen.route,
        routes: getRoutes(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
