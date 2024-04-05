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
          "temperature": 0.3,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Card Widget
            Card(
              elevation: 5,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: const CircleAvatar(
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
