// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// void main() => runApp(GoogleScreen());

// class GoogleScreen extends StatefulWidget {
//   @override
//   _GoogleScreenState createState() => _GoogleScreenState();
// }

// class _GoogleScreenState extends State<GoogleScreen> {
//   bool _isLoggedIn = false;
//   GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['Email']);

//   _login() async {
//     try {
//       await _googleSignIn.signIn();
//       setState(() {
//         _isLoggedIn = true;
//       });
//     } catch (error) {
//       print(error);
//     }
//   }

//   _logout() {
//     _googleSignIn.signOut();
//     setState(() {
//       _isLoggedIn = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Google Authentication'),
//         ),
//         body: Center(
//           child: _isLoggedIn
//               ? Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Image.network(
//                       _googleSignIn.currentUser.photoUrl,
//                       height: 80.0,
//                       width: 60.0,
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text(_googleSignIn.currentUser.displayName),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     OutlineButton(
//                       child: Text("Logout"),
//                       onPressed: () {
//                         _logout();
//                       },
//                     )
//                   ],
//                 )
//               : Center(
//                   child: OutlineButton(
//                     child: Text("Login with Google"),
//                     onPressed: () {
//                       _login();
//                     },
//                   ),
//                 ),
//         ),
//       ),
//     );
//   }
// }

//----------------------2--------------------------------------

// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _isLoggedIn = false;
//   GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['Email']);

//   loginWithGoogle() async {
//     try {
//       await _googleSignIn.signIn();
//       setState(() {
//         _isLoggedIn = true;
//       });
//     } catch (error) {
//       print(error);
//     }
//   }

//   _logout() {
//     _googleSignIn.signOut();
//     setState(() {
//       _isLoggedIn = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//           appBar: AppBar(
//             title: Text(
//               'Google Authentication',
//             ),
//             actions: <Widget>[
//               Container(
//                 child: _isLoggedIn
//                     ? CircleAvatar(
//                         radius: 30.0,
//                         backgroundImage:
//                             NetworkImage(_googleSignIn.currentUser.photoUrl),
//                       )
//                     : Center(),
//               )
//             ],
//           ),
//           body: _isLoggedIn
//               ? Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Text(_googleSignIn.currentUser.displayName),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     OutlineButton(
//                       child: Text("Logout"),
//                       onPressed: () {
//                         _logout();
//                       },
//                     )
//                   ],
//                   // child: _isLoggedIn
//                   //     ? Column(
//                   //         mainAxisAlignment: MainAxisAlignment.center,
//                   //         children: <Widget>[
//                   //           Image.network(
//                   //             _googleSignIn.currentUser.photoUrl,
//                   //             height: 80.0,
//                   //             width: 60.0,
//                   //           ),
//                   //           SizedBox(
//                   //             height: 5,
//                   //           ),
//                   //           Text(_googleSignIn.currentUser.displayName),
//                   //           SizedBox(
//                   //             height: 20,
//                   //           ),
//                   //           OutlineButton(
//                   //             child: Text("Logout"),
//                   //             onPressed: () {
//                   //               _logout();
//                   //             },
//                   //           )
//                   //         ],
//                   //       )
//                   //     : Center(
//                   //         child: OutlineButton(
//                   //           child: Text("Login with Google"),
//                   //           onPressed: () {
//                   //             loginWithGoogle();
//                   //           },
//                   //         ),
//                   //       ),
//                 )
//               : Center(
//                   child: OutlineButton(
//                     child: Text('Login With Google'),
//                     onPressed: () {
//                       loginWithGoogle();
//                     },
//                   ),
//                 )),
//     );
//   }
// }
