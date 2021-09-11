import 'package:flutter/material.dart';
import 'package:hacker_news/extras/constants/app_text_styles.dart';
import 'package:hacker_news/providers/news_details_provider.dart';
import 'package:hacker_news/widgets/progress_loader.dart';
import 'package:provider/provider.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({Key? key}) : super(key: key);

  static String route = "news-details-screen";

  @override
  Widget build(BuildContext context) {
    final searchScreenArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    context
        .read<NewsDetailsProvider>()
        .fetchNewsDetails(searchScreenArgs['objectID']);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        titleTextStyle: AppTextStyles.whiteText(),
      ),
      body: Consumer<NewsDetailsProvider>(
        builder: (context, newsDetails, _) {
          return newsDetails.isLoading
              ? progressLoader()
              : newsDetails.newsDetailsResponse.commentsList!.isEmpty
                  ? Center(
                      child: Text(
                        "No Comments",
                        style: AppTextStyles.blackText(26.0),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  newsDetails.newsDetailsResponse.title ??
                                      "No Title",
                                  style: AppTextStyles.blackText(18),
                                ),
                              ),
                              const SizedBox(width: 12),
                              FloatingActionButton(
                                heroTag: null,
                                onPressed: () {},
                                child: Text(
                                  newsDetails.newsDetailsResponse.points!
                                      .toString(),
                                  style: AppTextStyles.whiteText(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "Comments",
                            style: AppTextStyles.blackText(20),
                          ),
                          const SizedBox(height: 12),
                          Expanded(
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Text(
                                    "*** ${newsDetails.newsDetailsResponse.commentsList![index].text ?? "Null"}");
                              },
                              itemCount: newsDetails
                                  .newsDetailsResponse.commentsList!.length,
                              separatorBuilder: (context, _) {
                                return const Divider(
                                  color: Colors.black,
                                  thickness: 1,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
        },
      ),
    );
  }
}
