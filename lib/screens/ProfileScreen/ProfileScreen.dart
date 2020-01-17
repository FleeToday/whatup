import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Hero(
          tag: 'profile',
          child: Icon(
            Icons.account_circle,
            size: 50,
          ),
        ),
      ),
    );
  }
}
