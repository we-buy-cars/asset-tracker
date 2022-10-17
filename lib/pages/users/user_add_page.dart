import 'package:flutter/material.dart';

class UserAddPage extends StatefulWidget {

  const UserAddPage({ Key? key  }) : super(key: key);

  @override
  State<UserAddPage> createState() => _UserAddPageState();
}

class _UserAddPageState extends State<UserAddPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
      ),
      body: Center(
        child: Text(
          'User Add Page',
        ),
      ),
    );
  }
}
