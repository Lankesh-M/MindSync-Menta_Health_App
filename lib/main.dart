import 'package:flutter/material.dart';
import 'package:mindsync/page/LoginPage.dart';
import 'package:mindsync/page/PatientPage.dart';
// import 'package:mindsync/page/PatientPage.dart';
// import 'package:mindsync/page/TestPage.dart';

void main() {
  runApp(MindSync());
}

class MindSync extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        primaryColor: Colors.tealAccent[700],
        scaffoldBackgroundColor: Colors.grey[200],
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 16, color: Colors.grey[600]),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/temp': (context) => PatientPage(patient_name: "Patient1"),
      },
    );
  }
}
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter HTTP Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final String apiKey = "AIzaSyAPUcEYEeiEH44HnhWwIbMd35sBPs-U5SU";

//   Future<void> generateReport(String userInput) async {
//     final apiUrl =
//         'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.0-pro:generateContent?key=$apiKey';

//     final requestBody = jsonEncode({
//       "contents": [
//         {
//           "role": "user",
//           "parts": [
//             {
//               "text":
//                   "I need you to take a role here - the role of a report generator who generates a paper report after reading through the chat of a user and the chatbot. It will generate a report in the following format :Behavioural Observation : Explain how the person was behaving during the conversation online. The input will be provided in the form of a list. Each element of the list shall be a chat message and you have to conduct a sentimental analysis of the given statement and then analyze the sentiments of the user at the point for each chat . You don't need to show this part. What you need to do is combine the results and generate a single paragraph titled Behavioural Observation [And generate an overall report of the user's emotions and how they feel and why they feel so. If they went into emotional extremes at some point of the conversation add that as well. Remember this conversation is online so dig deeper and analyze him and then see his behaviour]and finally add this:[Conclusion: Add a mere summary of 5-7 sentences about what exactly is the person facing and a summar of the conversation - the following should be in bullet points:1) What the user is feeling overall2) Why the user is feeling so3) Past history of the user - bad habits if any4) How user is coping with it - that is if he is copingDon't generate output for this right now - do it once i give you the list..  also please make sure you do anything but please don't generate a recommendations paragraph "
//             }
//           ]
//         },
//         {
//           "role": "model",
//           "parts": [
//             {
//               "text":
//                   "Sure, I can generate a report analyzing the user's emotions and behaviors based on a provided chat log. I will follow the format you have specified and avoid generating recommendations.\n\nHowever, I need the list containing the chat messages to conduct the sentimental analysis. Once you provide me with the chat log, I can begin generating the report."
//             }
//           ]
//         },
//         {
//           "role": "user",
//           "parts": [
//             {"text": "YOUR_USER_INPUT"}
//           ]
//         }
//       ],
//       "generationConfig": {
//         "temperature": 0.9,
//         "topK": 1,
//         "topP": 1,
//         "maxOutputTokens": 2048,
//         "stopSequences": []
//       },
//       "safetySettings": [
//         {"category": "HARM_CATEGORY_HARASSMENT", "threshold": "BLOCK_NONE"},
//         {"category": "HARM_CATEGORY_HATE_SPEECH", "threshold": "BLOCK_NONE"},
//         {
//           "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
//           "threshold": "BLOCK_NONE"
//         },
//         {
//           "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
//           "threshold": "BLOCK_NONE"
//         }
//       ]
//     });

//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {'Content-Type': 'application/json'},
//         body: requestBody,
//       );

//       if (response.statusCode == 200) {
//         print('Report generated successfully.');
//         // Process the response as needed
//       } else {
//         print('Failed to generate report. Status code: ${response.statusCode}');
//       }
//     } catch (error) {
//       print('Error generating report: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('HTTP Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             // Call generateReport function with user input
//             print(generateReport("YOUR_USER_INPUT"));
//           },
//           child: const Text('Generate Report'),
//         ),
//       ),
//     );
//   }
// }
