import 'package:flutter/material.dart';

class GreetingPage extends StatefulWidget {

  const GreetingPage({Key? key}) : super(key: key);

  @override
  State<GreetingPage> createState() => _GreetingPageState();
}

class _GreetingPageState extends State<GreetingPage> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome to the Asset Tracker Hackathon',
      ),
    );
  }
}
