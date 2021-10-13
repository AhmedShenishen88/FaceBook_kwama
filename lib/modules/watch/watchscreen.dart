import 'package:flutter/material.dart';

class WatchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text(
          'Watch Screen',
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
      ),
    );
  }
}
