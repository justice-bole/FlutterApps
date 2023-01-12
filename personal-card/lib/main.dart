import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var mainColor = Colors.orange[800];
    var bgColor = Colors.green[900];
    var cardColor = Colors.lightGreen[900];
    return MaterialApp(
      home: Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/my_photo.jpeg'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Justice Bole',
                  style: TextStyle(
                    fontFamily: 'BebasNeue',
                    fontSize: 45.0,
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
                Text(
                  'Software Engineer'.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'Comfortaa',
                    fontSize: 18.0,
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: mainColor,
                    thickness: 2.0,
                  ),
                ),
                Card(
                  color: cardColor,
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone_outlined,
                      color: mainColor,
                    ),
                    title: Text(
                      '123 456 7890',
                      style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontSize: 22.0,
                        color: mainColor,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: cardColor,
                  margin: EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.email_outlined,
                      color: mainColor,
                    ),
                    title: Text(
                      'justicebole@yahoo.com',
                      style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontSize: 22.0,
                        color: mainColor,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/// Replicate image App
// class MyApp extends StatelessWidget {
//   const MyApp({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.teal,
//         body: SafeArea(
//           child: Row(
//             children: [
//               Container(
//                 width: 100,
//                 color: Colors.red,
//               ),
//               SizedBox(
//                 width: 46,
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: 100,
//                     height: 100,
//                     color: Colors.yellow,
//                   ),
//                   Container(
//                     width: 100,
//                     height: 100,
//                     color: Color.fromARGB(124, 255, 235, 50),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 width: 46,
//               ),
//               Container(width: 100, color: Colors.blue),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
