import 'package:flutter/material.dart';
import 'package:tagnid_e3fa_system/questions.dart';

void main() {
  runApp(ExemptionApp());
}

class ExemptionApp extends StatelessWidget {
  const ExemptionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'فحص الإعفاء من التجنيد',
      theme: ThemeData(
        fontFamily: 'Cairo', // Force Cairo as the global font
        primarySwatch: Colors.blue,
      ),
      home: Directionality(
          textDirection: TextDirection.rtl, child: QuestionsScreen()),
    );
  }
}
