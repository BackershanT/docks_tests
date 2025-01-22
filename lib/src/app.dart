
import 'package:flutter/material.dart';

import 'presentation/home_page/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:HomeScreen()
    );
  }
}

