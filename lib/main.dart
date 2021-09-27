import 'package:auraum_b2b_admin/screens/auth/splash_screen.dart';
import 'package:auraum_b2b_admin/screens/product_upload_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const ProductUploadScreen(),
    );
  }
}

