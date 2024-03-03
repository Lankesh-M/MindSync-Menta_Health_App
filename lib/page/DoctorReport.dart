import 'package:flutter/material.dart';
import 'package:dart_sentiment/dart_sentiment.dart';

// Sentiment sentiment = Sentiment();

// SentimentResult analyzeSentiment(String text) {
//   return sentiment.analysis(text);
// }

class Report extends StatelessWidget {
  final List<String> UserList;
  final List<String> BotList;

  Report({Key? key, required this.UserList, required this.BotList})
      : super(key: key);

  final sentiment = Sentiment();
  @override
  Widget build(BuildContext context) {
    final List<Widget> UserBot = [];

    int maxLength =
        UserList.length > BotList.length ? UserList.length : BotList.length;

    for (int i = 0; i < maxLength; i++) {
      if (i < UserList.length) {
        // SentimentResult userSentiment = analyzeSentiment(UserList[i]);
        var result = sentiment.analysis(UserList[i].toString());

        UserBot.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTileTheme(
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                child: ListTile(
                  tileColor: Colors.green[400],
                  leading: Icon(
                    Icons.person_outline,
                    color: Colors.white,
                    size: 32,
                  ),
                  title: Text(
                    UserList[i],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );

        UserBot.add(
          Container(
            width: 250,
            color: Colors.blue,
            child: Center(
              child: Text(
                sentiment.analysis(UserList[i].toString()).toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      }

      if (i < BotList.length) {
        UserBot.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTileTheme(
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                child: ListTile(
                  tileColor: Colors.pink,
                  leading: Icon(
                    Icons.android_outlined,
                    color: Colors.white,
                    size: 32,
                  ),
                  title: Text(
                    BotList[i],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: UserBot,
        ),
      ),
    );
  }
}
