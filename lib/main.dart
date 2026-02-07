import 'package:flutter/material.dart';
import 'cache_helper.dart';
import 'sebha.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await CacheHelper.init(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SebhaScreen(),
    );
  }
}
