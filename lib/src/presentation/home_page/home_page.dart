import 'package:flutter/material.dart';

import 'widgets/dock.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Dock(
                    items: [
                      Icons.person,
                      Icons.message,
                      Icons.call,
                      Icons.camera,
                      Icons.photo,
                    ],
                    builder: (e) {
                      return Tooltip(
                          message: e.toString(),
                          child: Container(
                            constraints: const BoxConstraints(minWidth: 48),
                            height: 48,
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.primaries[e.hashCode % Colors.primaries.length],
                            ),
                            child: Center(
                                child: Icon(
                                    e,color: Colors.white)),
                          ));
                    },
                  ),
                ))
          ]),
    );
  }
}
