import 'package:flutter/material.dart';
import 'package:mindsync/page/PatientPage.dart';
import 'package:mindsync/screen/ReportSent.dart';
import 'package:mindsync/widget/BottomNavigaton.dart';

class DoctorDetails extends StatefulWidget {
  DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  final List<Map<String, String>> profiles = [
    {
      'name': 'Dr. Sandhiya',
      'age': '28',
      'experience': '3 years',
      'location': 'Chennai, India',
      'image':
          'https://imgs.search.brave.com/sV8Y1Dmf7uNssLl1b-lzK2LyWrpITLQMfVOD5aSyILs/rs:fit:860:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzA0LzAxLzMzLzAx/LzM2MF9GXzQwMTMz/MDE2Ml9VSm1tZkd4/d1BweXAyczRCRkQ1/OXE2YXpsejlVdVFS/Ri5qcGc',
      'contact': "+91 9876155272",
      'bio':
          'Hi, I\'m Dr. Sandhiya, a Clinical Psychologist specializing in cognitive-behavioral therapy and mindfulness. I focus on anxiety, depression, and relationship challenges.',
    },
    {
      'name': 'Dr. Ram Kumar',
      'age': '28',
      'experience': '4 years',
      'location': 'Bombay, India',
      'image':
          'https://imgs.search.brave.com/nx7xV_9jXk7FIMOawriAFoHtaPR_wpk0375qwEGnfas/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTM0/MjcwODg1OS9waG90/by9wb3J0cmFpdC1v/Zi1hLW1hbGUtZG9j/dG9yLmpwZz9zPTYx/Mng2MTImdz0wJms9/MjAmYz03b2p2ZlNu/TE54NzNzUjF4WFRS/ZUJySVhKT1pQcFNO/RlozRTlDb2RzZlFV/PQ',
      'contact': "+91 7354329162",
    },
    {
      'name': 'Dr. Arjun',
      'age': '32',
      'experience': '5 years',
      'location': 'Trichy, India',
      'image':
          'https://imgs.search.brave.com/2Y-WdnIDoStXOFp-LtXI9-iOkwttIhOMsD-bV4pz6FU/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTQ4/NjE3Mjg0Mi9waG90/by9wb3J0cmFpdC1v/Zi1tYWxlLW51cnNl/LWluLWhpcy1vZmZp/Y2Uud2VicD9iPTEm/cz0xNzA2NjdhJnc9/MCZrPTIwJmM9WDRU/R3ZZa2dFMEhxcWR3/djEzejQ3bXNnZk5B/RkxIOXVkR1hQeldI/bFQ5QT0',
      'contact': "+91 9752307532",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NaviBar(
        currindex: 2,
      ),
      appBar: AppBar(
        title: const Center(child: Text('Choose your doctor')),
      ),
      body: PageView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          return ProfileCard(profile: profiles[index]);
        },
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final Map<String, String> profile;

  ProfileCard({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 215,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(profile['image']!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // User details at the bottom
        Container(
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profile['name']!,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Text('+91 9834927651'),
              Row(
                children: [
                  const Icon(Icons.phone),
                  SizedBox(
                    width: 5,
                  ),
                  Text("${profile['contact']}")
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Age: ${profile['age']}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              Text(
                'Experience: ${profile['experience']}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              Text(
                'Location: ${profile['location']}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              Text(
                'Bio: ${profile['bio']}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    width: 150.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.blue,
                          Color.fromARGB(255, 183, 195, 215)
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReportSent(
                                    child: const PatientPage(
                                        patient_name: "Patient1"),
                                  )),
                          (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      child: const Text(
                        "Send Report",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.5,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 150.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.blue,
                          Color.fromARGB(255, 183, 195, 215)
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReportSent(
                                    child: const PatientPage(
                                        patient_name: "Patient1"),
                                  )),
                          (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      child: const Text(
                        "Book an Appoinment",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.5,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
