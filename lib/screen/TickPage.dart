import 'package:flutter/material.dart';
import 'package:mindsync/page/DoctorDetails.dart';

class Tick extends StatefulWidget {
  final Widget? child;
  Tick({super.key, required this.child});

  @override
  State<Tick> createState() => _TickState();
}

class _TickState extends State<Tick> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => widget.child!),
          (route) => false);
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400],
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(211, 136, 220, 140),
                Color.fromARGB(255, 59, 212, 177),
              ],
            ),
          ),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Center along the main axis (vertical)
              crossAxisAlignment: CrossAxisAlignment
                  .center, // Center along the cross axis (horizontal)
              children: [
                SizedBox(
                  height: 150,
                ),
                Center(
                  child: Image(
                    height: 150,
                    width: 150,
                    // image: AssetImage("images/check.png"),
                    image: NetworkImage(
                        'https://imgs.search.brave.com/kryefiKYi3q7dB0MSygZzAYMu4ca9XcYqzjskLAPdNs/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9jbGlw/YXJ0LWxpYnJhcnku/Y29tL2ltYWdlcy9w/YzVvNzhkOWkucG5n'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Thank you!",
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Your response has been saved",
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Please continue to consult a doctor",
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 180,
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     showDialog(
                //       context: context,
                //       builder: (context) => DoctorDetails(),
                //     );
                //   },
                //   child: const Text("Continue"),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
