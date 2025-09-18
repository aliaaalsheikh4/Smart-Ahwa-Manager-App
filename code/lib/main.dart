import 'package:flutter/material.dart';
import 'package:project1/ahwa_manager.dart';

void main() => runApp(AhwaApp());

class AhwaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AhwaManager',
      home: AhwaManager(),
    );
  }
}