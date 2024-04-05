import 'package:flutter/material.dart';
import 'package:mindsync/page/DoctorDetails.dart';
import 'package:mindsync/page/TestPage.dart';
import 'package:mindsync/widget/BottomNavigaton.dart';

class PatientPage extends StatelessWidget {
  const PatientPage({super.key, required this.patient_name});
  final String patient_name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NaviBar(
        currindex: 0,
      ),
      // body: Container(
      //   decoration: const BoxDecoration(
      //     gradient: LinearGradient(
      //       begin: Alignment.topCenter,
      //       end: Alignment.bottomCenter,
      //       colors: [
      //         Color.fromARGB(211, 136, 220, 140),

      //         // Colors.teal,
      //         Color.fromARGB(255, 59, 212, 177),
      //         // Color(0xFF4DB6AC),
      //       ],
      //     ),
      //   ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://imgs.search.brave.com/J791ZkSuBgY_YQpYN1X--9z8q4lH6WZIh9TjWeAIi20/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzQ5L2Rh/LzQyLzQ5ZGE0MmQ3/Njc0NzIzY2FkYjVj/YjUzZDg5MWI3ODZm/LmpwZw'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Hello, $patient_name',
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Test()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size(200, 50),
                ),
                child: const Text('Take a Test',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16.5,
                        fontWeight: FontWeight.w600)),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DoctorDetails()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size(200, 50),
                ),
                child: const Text(
                  'Book an Appoinment',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16.5,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DoctorDetails()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size(200, 50),
                ),
                child: const Text(
                  'Track your Daily Routine',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16.5,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
