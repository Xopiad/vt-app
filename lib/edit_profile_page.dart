import 'package:flutter/material.dart';
import 'account.dart';

class EditProfilePage extends StatelessWidget {
  final Account account;

  EditProfilePage({this.account});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              //Firebase stuff but for now some dummy code
            },
          )
        ],
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            RawMaterialButton(
              onPressed: () {
                //TODO: Bring up menu to change profile picture
              },
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill, image: this.account.profilePicture)),
              ),
              shape: CircleBorder(),
              elevation: 2.0,
            ),
            TextFormField(
              enableInteractiveSelection: true,
              decoration: InputDecoration(labelText: 'Email'),
              initialValue: this.account.emailAddress,
            ),
            TextFormField(
              enableInteractiveSelection: true,
              decoration: InputDecoration(labelText: 'Phone Number'),
              initialValue: this.account.phoneNumber,
            ),
          ],
        ),
      ),
    );
  }
}
