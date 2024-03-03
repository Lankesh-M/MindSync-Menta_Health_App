import 'package:flutter/material.dart';
import 'package:mindsync/page/MimiBot.dart';

class TalkToBot extends StatelessWidget {
  const TalkToBot({super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Center(
    //     child: Container(
    //       width: 200.0,
    //       height: 60.0,
    //       // decoration: BoxDecoration(
    //       //   borderRadius: BorderRadius.circular(15.0),
    //       //   gradient: LinearGradient(
    //       //     begin: Alignment.topCenter,
    //       //     end: Alignment.bottomCenter,
    //       //     colors: [Colors.blue, Colors.blueAccent],
    //       //   ),
    //       // ),
    //       decoration: BoxDecoration(
    //         gradient: LinearGradient(
    //           begin: Alignment.topCenter,
    //           end: Alignment.bottomCenter,
    //           colors: [
    //             Color.fromARGB(211, 136, 220, 140),

    //             // Colors.teal,
    //             Color.fromARGB(255, 59, 212, 177),
    //             // Color(0xFF4DB6AC),
    //           ],
    //         ),
    //       ),
    //       child: ElevatedButton(
    //         onPressed: () {
    //           Navigator.pushAndRemoveUntil(
    //             context,
    //             MaterialPageRoute(builder: (context) => Chatbot()),
    //             (route) => false,
    //           );
    //         },
    //         style: ElevatedButton.styleFrom(
    //           backgroundColor:
    //               Colors.transparent, // Make the button background transparent
    //           elevation: 0, // Remove the button's shadow
    //         ),
    //         child: Text(
    //           "Talk to Chat Bot",
    //           style: TextStyle(
    //             color: Colors.white,
    //             fontSize: 18.0, // Adjust the font size
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(211, 136, 220, 140),

              // Colors.teal,
              Color.fromARGB(255, 59, 212, 177),
              // Color(0xFF4DB6AC),
            ],
          ),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Chatbot()),
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              side: const BorderSide(color: Colors.black, width: 2),
              shape: const RoundedRectangleBorder(),
              backgroundColor: const Color.fromARGB(201, 0, 255, 229),
              elevation: 20,
              padding: const EdgeInsets.all(40),
            ),
            child: const Text(
              "Talk to Mimi Bot",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
