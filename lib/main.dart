import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:syllabuspu/screens/notes_screen.dart';
import 'package:syllabuspu/screens/qbank_screen.dart';
import 'package:syllabuspu/screens/syllabus_screen.dart';

import 'screens/main_screen.dart';
import 'screens/login_screen.dart';
import 'screens/spash_screen.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Syllabus',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: defaultTargetPlatform == TargetPlatform.iOS
                ? Color(0xFF0777A7)
                : null),
        initialRoute: MainScreen.id,
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          MainScreen.id: (context) => MainScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          QBankScreen.id: (context) => QBankScreen(),
          SyllabusScreen.id: (context) => SyllabusScreen(),
          NotesScreen.id: (context) => NotesScreen(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: MainScreen(),
    );
  }
}
