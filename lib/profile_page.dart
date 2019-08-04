import 'package:flutter/material.dart';
import 'account.dart';

class ProfilePage extends StatelessWidget {

  final Account account;

  ProfilePage({this.account});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: <Widget>[],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Profile Page of ${account.first_name} ${account.last_name}')
          ],
        ),
      ),
    );
  }
}
