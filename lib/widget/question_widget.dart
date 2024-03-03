import 'package:flutter/material.dart';
import 'package:mindsync/model/question_model.dart';

class QuestionWidget extends StatefulWidget {
  final Question question;
  final Function(double) onOptionSelected;

  QuestionWidget({required this.question, required this.onOptionSelected});

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              widget.question.text,
              style: const TextStyle(
                  fontSize: 16.8,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w700),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  widget.onOptionSelected(1);
                  setState(() {
                    widget.question.selectedOption =
                        'None of the time'; // Update the selected option
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      widget.question.selectedOption == 'None of the time'
                          ? Colors.green
                          : Colors.tealAccent,
                ),
                child: const Text('None of the time',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  widget.onOptionSelected(0.5);
                  setState(() {
                    widget.question.selectedOption = 'A little of the time';
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      widget.question.selectedOption == 'A little of the time'
                          ? Colors.green
                          : Colors.tealAccent,
                ),
                child: const Text('A little of the time',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  widget.onOptionSelected(0.25);
                  setState(() {
                    widget.question.selectedOption =
                        'Most of the time'; // Update the selected option
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      widget.question.selectedOption == 'Most of the time'
                          ? Colors.green
                          : Colors.tealAccent,
                ),
                child: const Text('Most of the time',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  widget.onOptionSelected(0);
                  setState(() {
                    widget.question.selectedOption =
                        'All of the time'; // Update the selected option
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      widget.question.selectedOption == 'All of the time'
                          ? Colors.green
                          : Colors.tealAccent,
                ),
                child: const Text('All of the time',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
//Not at all - 0, Several days - 0.25, More than half day - 0.5, Nearly everyday - 1