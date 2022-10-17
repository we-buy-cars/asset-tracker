import 'package:asset_tracker/apis/apis.dart';
import 'package:flutter/material.dart';

class UserEditPage extends StatefulWidget {

  final User user;

  const UserEditPage({ Key? key, required this.user }) : super(key: key);

  @override
  State<UserEditPage> createState() => _UserEditPageState();
}

class _UserEditPageState extends State<UserEditPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User'),
      ),
      body: Center(
        child: Text(
          'User Edit Page: ${widget.user.id}',
        ),
      ),
    );
  }
}
