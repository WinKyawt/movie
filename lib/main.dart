import 'package:flutter/material.dart';
import 'package:mmvideo/splash_screen.dart';

//  WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setSystemUIOverlayStyle(
//     const SystemUiOverlayStyle(
//       statusBarColor: Colors.blueAccent,
//     ),
//   );
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //  theme: ThemeData(
      //   primarySwatch: Colors.amber,
      // ),
      home: Splash(),
    );
  }
}

