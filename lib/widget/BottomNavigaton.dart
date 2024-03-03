import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mindsync/page/DoctorDetails.dart';
import 'package:mindsync/page/LoginPage.dart';
import 'package:mindsync/page/MimiBot.dart';
import 'package:mindsync/page/PatientPage.dart';

class NaviBar extends StatefulWidget {
  const NaviBar({super.key});

  @override
  State<NaviBar> createState() => _NaviBarState();
}

class _NaviBarState extends State<NaviBar> {
  GlobalKey<CurvedNavigationBarState> _key = GlobalKey();
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: _key,
      backgroundColor: Colors.tealAccent,
      items: const [
        CurvedNavigationBarItem(child: Icon(Icons.home), label: ""),
        CurvedNavigationBarItem(child: Icon(Icons.android), label: ""),
        CurvedNavigationBarItem(
            child: Icon(Icons.local_hospital_outlined), label: ""),
        CurvedNavigationBarItem(
          child: Icon(Icons.login_outlined),
          label: "",
        ),
      ],
      height: 60,
      index: _index,
      onTap: (selectedIndex) {
        print(selectedIndex);
        setState(() {
          _index = selectedIndex;
        });

        switch (selectedIndex) {
          case 0:
            // Navigate to the Home screen
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const PatientPage(patient_name: "Patient1")));

            break;
          case 1:
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Chatbot()));
            break;
          case 2:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DoctorDetails()));
            break;
          case 3:
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
            break;
          // default:
        }
      },
      letIndexChange: (index) => true,
    );
  }
}
