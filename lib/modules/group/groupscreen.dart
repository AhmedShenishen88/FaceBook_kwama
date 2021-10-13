import 'package:flutter/material.dart';

class GroupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text(
          'Group Screen',
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
      ),
    );
  }
}
