// import 'package:flutter/material.dart';
// import 'package:dart_sentiment/dart_sentiment.dart';

// // Sentiment sentiment = Sentiment();

// // SentimentResult analyzeSentiment(String text) {
// //   return sentiment.analysis(text);
// // }

// class Report extends StatelessWidget {
//   final List<String> UserList;
//   final List<String> BotList;

//   Report({Key? key, required this.UserList, required this.BotList})
//       : super(key: key);

//   final sentiment = Sentiment();
//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> UserBot = [];

//     int maxLength =
//         UserList.length > BotList.length ? UserList.length : BotList.length;

//     for (int i = 0; i < maxLength; i++) {
//       if (i < UserList.length) {
//         // SentimentResult userSentiment = analyzeSentiment(UserList[i]);
//         var result = sentiment.analysis(UserList[i].toString());

//         UserBot.add(
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 8.0),
//             child: Card(
//               elevation: 8,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: ListTileTheme(
//                 contentPadding: EdgeInsets.symmetric(horizontal: 16),
//                 child: ListTile(
//                   tileColor: Colors.green[400],
//                   leading: Icon(
//                     Icons.person_outline,
//                     color: Colors.white,
//                     size: 32,
//                   ),
//                   title: Text(
//                     UserList[i],
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );

//         UserBot.add(
//           Container(
//             width: 250,
//             color: Colors.blue,
//             child: Center(
//               child: Text(
//                 sentiment.analysis(UserList[i].toString()).toString(),
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         );
//       }

//       if (i < BotList.length) {
//         UserBot.add(
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 8.0),
//             child: Card(
//               elevation: 8,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: ListTileTheme(
//                 contentPadding: EdgeInsets.symmetric(horizontal: 16),
//                 child: ListTile(
//                   tileColor: Colors.pink,
//                   leading: Icon(
//                     Icons.android_outlined,
//                     color: Colors.white,
//                     size: 32,
//                   ),
//                   title: Text(
//                     BotList[i],
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       }
//     }

//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView(
//           children: UserBot,
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mindsync/widget/BottomNavigaton.dart';
import 'package:mindsync/widget/Drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatAnalysisPage extends StatefulWidget {
  final List<String> UserList;
  const ChatAnalysisPage({super.key, required this.UserList});

  @override
  _ChatAnalysisPageState createState() => _ChatAnalysisPageState();
}

class _ChatAnalysisPageState extends State<ChatAnalysisPage> {
  String result = '';

  Future<void> generateReport(List<String> chatMessages) async {
    try {
      const String apiKey =
          "AIzaSyAPUcEYEeiEH44HnhWwIbMd35sBPs-U5SU"; // Replace with your actual API key
      const String apiUrl =
          "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.0-pro:generateContent?key=$apiKey";

      final requestBody = {
        "contents": [
          {
            "role": "user",
            "parts": [
              {
                "text":
                    "you are an psychatrist you should create a report from the given responses"
              }
            ]
          },
          {
            "role": "model",
            "parts": [
              {
                "text":
                    "Sure, I can generate a report analyzing the user's emotions and behaviors based on a provided chat log. I will follow the format you have specified and avoid generating recommendations."
              }
            ]
          },
          {
            "role": "user",
            "parts": chatMessages.map((msg) => {"text": msg}).toList(),
          }
        ],
        "generationConfig": {
          "temperature": 0.5,
          "topK": 1,
          "topP": 1,
          "maxOutputTokens": 2048,
          "stopSequences": []
        },
        "safetySettings": [
          {"category": "HARM_CATEGORY_HARASSMENT", "threshold": "BLOCK_NONE"},
          {"category": "HARM_CATEGORY_HATE_SPEECH", "threshold": "BLOCK_NONE"},
          {
            "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
            "threshold": "BLOCK_NONE"
          },
          {
            "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
            "threshold": "BLOCK_NONE"
          }
        ]
      };

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );

      print('Request: ${jsonEncode(requestBody)}');
      print('Response: ${response.statusCode} - ${response.body}');

      if (response.statusCode == 200) {
        setState(() {
          final jsonResponse = jsonDecode(response.body);
          // result = jsonResponse['contents'][0]['parts'][0]['text'];
          // print(result);
          result = jsonResponse['candidates'][0]['content']['parts'][0]['text'];
          print(jsonResponse['candidates'][0]['content']['parts'][0]['text']);
        });
      } else {
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      // drawer: Drawe,
      // bottomNavigationBar: NaviBar(),
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Patient Report',
        )),
      ),
      body: Center(
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     const Card(
        //       elevation: 5,
        //       margin: const EdgeInsets.all(10),
        //       child: ListTile(
        //         leading: CircleAvatar(
        //           // You can use a profile picture here
        //           backgroundColor: Colors.teal,
        //           child: Text(
        //             'P', // Displaying the first letter of the patient's name as a placeholder
        //             style: TextStyle(
        //               fontWeight: FontWeight.bold,
        //               color: Colors.white,
        //             ),
        //           ),
        //         ),
        //         title: Text(
        //           'Patient1',
        //           style: TextStyle(fontWeight: FontWeight.bold),
        //         ),
        //         subtitle: Text(
        //           'Age: 25',
        //         ),
        //       ),
        //     ),
        //     ElevatedButton(
        //       onPressed: () async {
        //         // Example list of chat messages
        //         // List<String> chatMessages = [
        //         //   "Hi there",
        //         //   "I am feeling kinda down but hey i guess life is just that way what can i do about it hmmm i wonder",
        //         //   "You see my wife recently cheated on me",
        //         //   "I am a cop and i am unable to find much time for her in my life and then one night i walked into her room and found her cheating on me",
        //         //   "It was heartbreaking for me but i am thinking of moving on in life",
        //         //   "I am still thinking about how can i achieve a new state of mental clarity and how to improve in life",
        //         //   "At times though i feel very very very depressed and i can't really tell what i should be doing with myself",
        //         //   "Can you please elaborate what i should do",
        //         //   "Well it seems my situation is really bad man i can't help but feel rather inferior to others",
        //         //   "Whatever man thanks for the conversation though"
        //         // ];

        //         final prefs = await SharedPreferences.getInstance();
        //         final List<String>? loadedUserList =
        //             prefs.getStringList('UserList');
        //         generateReport(loadedUserList ?? []);
        //       },
        //       child: const Text('Show Report'),
        //     ),
        //     const SizedBox(height: 20),
        //     Expanded(
        //       child: SingleChildScrollView(
        //         child: Container(
        //           padding: const EdgeInsets.all(10),
        //           child: Text(
        //             result,
        //             textAlign: TextAlign.center,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Card Widget
            Card(
              elevation: 5,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: const CircleAvatar(
                  // You can use a profile picture here
                  backgroundColor: Colors.teal,
                  child: Text(
                    'P', // Displaying the first letter of the patient's name as a placeholder
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                title: const Text(
                  'Patient1',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Age: 20',
                ),
                trailing: ElevatedButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    final List<String>? loadedUserList =
                        prefs.getStringList('UserList');
                    generateReport(loadedUserList ?? []);
                  },
                  child: const Text('Show Report'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    result,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
