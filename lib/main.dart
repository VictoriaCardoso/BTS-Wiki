import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const BTSApp());
}

class BTSApp extends StatelessWidget {
  const BTSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BTS ARMY',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 202, 178, 244),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

