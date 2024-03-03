// import 'package:flutter/material.dart';

// class PatientDetailsPage extends StatelessWidget {
//   const PatientDetailsPage({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Patient Details'),
//       ),
//       body: ListView.builder(
//         itemCount: 2,
//         itemBuilder: (context, index) {
//           return Card(
//             elevation: 5,
//             margin: EdgeInsets.all(10),
//             child: ListTile(
//               title: Text(),
//               subtitle: Text(
//                   'Age: ${patients[index].age} | Condition: ${patients[index].condition}'),
//               // You can add more information to be displayed in the card
//               onTap: () {
//                 // Handle the tap on the card, e.g., navigate to a detailed view
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => PatientDetailsScreen(patient: patients[index])),
//                 // );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
