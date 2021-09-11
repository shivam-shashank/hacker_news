import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hacker_news/extras/constants/app_text_styles.dart';
import 'package:hacker_news/providers/search_news_provider.dart';
import 'package:hacker_news/response/search_news/hits.dart';
import 'package:hacker_news/screens/news_details_screen.dart';
import 'package:hacker_news/widgets/flutter_toast.dart';
import 'package:hacker_news/widgets/progress_loader.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  static String route = "search-screen";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchTEC = TextEditingController();

  static const UnderlineInputBorder _bottomBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 1,
    ),
  );

  _onSubmit(SearchNewsProvider searchedNews) {
    if (_searchTEC.text.isEmpty) {
      flutterToast("Searched Query can't be empty.");
    } else {
      searchedNews.isLoading = true;
      searchedNews.fetchSearchedNews(_searchTEC.text);

      FocusScope.of(context).unfocus();
    }
  }

  @override
  void dispose() {
    super.dispose();

    _searchTEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchNewsProvider>(
      builder: (context, searchedNews, _) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                setState(() => _searchTEC.clear());
              },
            ),
            title: TextFormField(
              controller: _searchTEC,
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: AppTextStyles.whiteText(),
                enabledBorder: _bottomBorder,
                focusedBorder: _bottomBorder,
              ),
              style: AppTextStyles.whiteText(),
              validator: (value) {
                if (value!.isEmpty) return "Searched Keyword can't be empty.";
                return null;
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () => _onSubmit(searchedNews),
              ),
            ],
          ),
          body: _searchTEC.text.isEmpty
              ? Center(
                  child: Text(
                    "Search on Hacker News",
                    style: AppTextStyles.blackText(26.0),
                  ),
                )
              : searchedNews.isLoading
                  ? progressLoader()
                  : searchedNews.searchNewsResponse.hitsList!.isEmpty
                      ? Center(
                          child: Text(
                            "No Results",
                            style: AppTextStyles.blackText(26.0),
                          ),
                        )
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            Hits _singleHits = searchedNews
                                .searchNewsResponse.hitsList![index];

                            return GestureDetector(
                              child: Card(
                                elevation: 8,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 14,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _singleHits.title ?? "No Title",
                                        style: AppTextStyles.blackText(20.0),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          _singleHits.author ?? "No Author",
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () => Navigator.pushNamed(
                                context,
                                NewsDetailsScreen.route,
                                arguments: {
                                  "objectID": _singleHits.objectID ?? "123",
                                },
                              ),
                            );
                          },
                          itemCount:
                              searchedNews.searchNewsResponse.hitsList!.length,
                        ),
        );
      },
    );
  }
}
