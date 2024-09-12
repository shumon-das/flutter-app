import 'package:crud/pages/home/home_page.dart';
import 'package:crud/pages/home_page_old.dart';
import 'package:crud/pages/image_to_text.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/entertainment/entertainment_page.dart';
import 'pages/jobs/jobs_page.dart';
import 'pages/literature/Literature_page.dart';
import 'pages/users/profile_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      // home: ImageToText(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   int bnbSelectedIndex = 0;

  static const data = <Widget>[
    HomePage(),
    JobsPage(),
    LiteraturePage(),
    EntertainmentPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('CRUD'),
      ),
      body: data[bnbSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', backgroundColor: Colors.deepPurple),
          BottomNavigationBarItem(icon: Icon(Icons.accessibility_sharp), label: 'Jobs', backgroundColor: Colors.deepPurple),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Literature', backgroundColor: Colors.deepPurple),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Entertain', backgroundColor: Colors.deepPurple),
          BottomNavigationBarItem(icon: Icon(Icons.person_pin), label: 'Profile', backgroundColor: Colors.deepPurple),
        ],
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        currentIndex: bnbSelectedIndex,
        onTap: (int index) {
            setState(() {
              bnbSelectedIndex = index;
            });
        },
      ),
    );
  }
}
