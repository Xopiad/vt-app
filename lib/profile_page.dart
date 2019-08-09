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
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: <Widget>[
            Container(
                width: 190.0,
                height: 190.0,
                margin: EdgeInsets.symmetric(vertical: 25, horizontal: 100),
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new AssetImage(
                            //TODO: Change to account.profile_picture
                            "assets/Ving Tsun Kung Fu Association Americas.png")))),
            Column(
              children: <Widget>[
                Text(
                  '${account.first_name} ${account.last_name}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ],
            ),
            Divider(
              color: Colors.white,
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                spacedText("email", "${account.email_address}"),
                Divider(
                  color: Colors.grey,
                ),
                spacedText("leftText", "rightText")
              ],
            )
          ],
        ),
      ),
    );
  }

  Row spacedText(String leftText, String rightText) {
    return Row(
      children: <Widget>[
        Text(leftText,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20)),
        Spacer(),
        Text(rightText,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20)),
      ],
    );
  }
}
