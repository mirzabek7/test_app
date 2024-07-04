import 'package:flutter/material.dart';
import 'package:test_app/screens/custom_calendar.dart';
import 'package:test_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Nunito',
        scaffoldBackgroundColor: Color(0xffFFFDFC),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: {
        CustomCalendar.routeName: (context) => const CustomCalendar(),
      },
    );
  }
}
