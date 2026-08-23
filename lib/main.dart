import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/library_page.dart';
import 'pages/profile_page.dart';

void main() {
  runApp(const LuminookApp());
}

class LuminookApp extends StatelessWidget {
  const LuminookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Luminook',

      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),

      home: const MainPage(),
    );
  }
}


// ==================================================
// MAIN PAGE
// ==================================================

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  // Current selected page
  int selectedIndex = 0;

  // All pages
  final List<Widget> pages = const [
    HomePage(),
    LibraryPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Show selected page
      body: pages[selectedIndex],

      // ==================================================
      // BOTTOM NAVIGATION BAR
      // ==================================================

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,

        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        destinations: const [

          // HOME
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: "Home",
          ),

          // LIBRARY
          NavigationDestination(
            icon: Icon(Icons.library_books_outlined),
            selectedIcon: Icon(Icons.library_books),
            label: "Library",
          ),

          // PROFILE
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}