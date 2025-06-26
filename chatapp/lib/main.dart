import 'package:camera/camera.dart';
import 'package:chatapp/Screens/camera_screen.dart';
import 'package:chatapp/Screens/home_screen.dart';
import 'package:chatapp/Screens/login_screen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'OpenSans',
        primaryColor: Color(0xff075E54),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color(0xff128C7E),
        ),
      ),
      home: LoginScreen(),
    );
  }
}
