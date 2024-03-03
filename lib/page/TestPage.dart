import 'package:flutter/material.dart';
import 'package:mindsync/model/question_model.dart';
import 'package:mindsync/page/MimiBot.dart';
import 'package:mindsync/screen/TalkBot.dart';
import 'package:mindsync/widget/BottomNavigaton.dart';
import 'package:mindsync/widget/question_widget.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final PageController _pageController = PageController();
  List<Question> questions = [
    Question(
        "Question 1: Feeilng bad about yourself - or that you're a failure or have let yourself or your family down",
        0),
    Question("Question 2: Little interest or pleasure in doing things", 0),
    Question(
        "Question 3: Thoughts that you would be better off dead, or of hurting yourself",
        0),
    Question("Question 4: Being so restless that it is hard to sit still", 0),
    Question(
        "Question 5: Feeling affraid, as if something awful might happen", 0),
    Question("Question 6: Often feeling tired out for no good reason", 0),
    Question(
        "Question 7: How often did you feel so sad that nothing could cheer you up",
        0),
    Question(
        "Question 8: I couldn't seem to experience any positive feeling at all",
        0),
    Question("Question 9: I found myself getting agitated", 0),
    Question("Question 10: I felt that I had nothing to look forward to", 0),
  ];

  double totalScore = 0;
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: grad,
      bottomNavigationBar: NaviBar(),
      // appBar: AppBar(
      //   title: Text(
      //     'Test',
      //     style: TextStyle(
      //       fontSize: 25,
      //       // color: Theme.of(context).primaryColor,
      //     ),
      //   ),
      //   backgroundColor: Colors.blue[300],
      // ),
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
        child: PageView.builder(
          controller: _pageController,
          itemCount: questions.length,
          onPageChanged: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QuestionWidget(
                    question: questions[currentPageIndex],
                    onOptionSelected: (score) {
                      setState(() {
                        questions[currentPageIndex].score = score;
                        totalScore = questions
                            .map((question) => question.score)
                            .reduce((a, b) => a + b);

                        if (currentPageIndex < questions.length - 1) {
                          currentPageIndex++;
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        } else {
                          // if (totalScore <= 5) {
                          //   Navigator.pushAndRemoveUntil(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => const TalkToBot()),
                          //       (route) => false);
                          // } else {}
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TalkToBot()),
                              (route) => false);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text(
                                  'Mental Health Score',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                content: Text(
                                  'Score: $totalScore/10',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      });
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
