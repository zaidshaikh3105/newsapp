// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:flutter/material.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;

// class UserProfile extends StatefulWidget {
//   @override
//   _UserProfileState createState() => _UserProfileState();
// }

// class _UserProfileState extends State<UserProfile> {
//   @override
//   Widget build(BuildContext context) {
//     print(_auth.currentUser!.phoneNumber.toString());

//     return Scaffold(
//         appBar: AppBar(
//             centerTitle: true,
//             backgroundColor: Colors.white30,
//             title: Text(
//               "User Profile",
//               style: TextStyle(color: Colors.black),
//             )),
//         body: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   child: Container(
//                     width: double.infinity,
//                     height: 200,
//                     child: Container(
//                       alignment: Alignment(0.0, 2.5),
//                       child: CircleAvatar(
//                         backgroundColor: Colors.white,
//                         backgroundImage: NetworkImage(
//                             (_auth.currentUser!.photoURL.toString())),
//                         radius: 60.0,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 60,
//                 ),
//                 Text(
//                   "User Email",
//                   style: TextStyle(
//                       fontSize: 20.0,
//                       color: Colors.black,
//                       letterSpacing: 2.0,
//                       fontWeight: FontWeight.w400),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   _auth.currentUser!.email.toString(),
//                   style: TextStyle(
//                       fontSize: 20.0,
//                       color: Colors.blueAccent,
//                       fontWeight: FontWeight.w400),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Text(
//                   "User Name",
//                   style: TextStyle(
//                       fontSize: 30.0,
//                       color: Colors.black,
//                       letterSpacing: 2.0,
//                       fontWeight: FontWeight.w400),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   _auth.currentUser!.displayName.toString(),
//                   style: TextStyle(
//                       fontSize: 30.0,
//                       color: Colors.blueAccent,
//                       letterSpacing: 2.0,
//                       fontWeight: FontWeight.w400),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Text(
//                   "User Phone",
//                   style: TextStyle(
//                       fontSize: 30.0,
//                       color: Colors.black,
//                       letterSpacing: 2.0,
//                       fontWeight: FontWeight.w400),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   _auth.currentUser!.phoneNumber.toString(),
//                   style: TextStyle(
//                       fontSize: 30.0,
//                       color: Colors.blueAccent,
//                       letterSpacing: 2.0,
//                       fontWeight: FontWeight.w400),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextButton.icon(
//                     style: TextButton.styleFrom(
//                       primary: Colors.blue,
//                       backgroundColor: Colors.white54,
//                       onSurface: Colors.grey,
//                       //     side: BorderSide(color: Colors.white, width: 5),
//                       shape: const BeveledRectangleBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(5))),
//                     ),
//                     label: Text('Sign Out'),
//                     icon: Icon(Icons.email_rounded),
//                     onPressed: () async {
                      
                      
//                     })
//               ],
//             ),
//           ),
//         ));
//   }
// }

// /*body: Column(
//         children: [
//           Image(image: NetworkImage(_auth.currentUser!.photoURL.toString())),
//           Text(_auth.currentUser!.displayName.toString())
//         ],
//       ),*/
