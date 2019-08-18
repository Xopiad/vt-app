import 'package:flutter/material.dart';
import 'package:vt_app/edit_profile_page.dart';
import 'account.dart';

class ProfilePage extends StatelessWidget {
  final Account account;

  ProfilePage({this.account});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EditProfilePage(account: this.account)));
            },
          ),
        ],
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: <Widget>[
            Container(
                width: 190.0,
                height: 190.0,
                margin: EdgeInsets.symmetric(vertical: 25, horizontal: 100),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill, image: account.profilePicture))),
            Column(
              children: <Widget>[
                Text(
                  '${account.firstName} ${account.lastName}',
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
                children: formattedInfo(account))
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
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
        Spacer(),
        Text(rightText,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
      ],
    );
  }

  List<Widget> formattedInfo(Account account) {
    return [
      spacedText("Email", "${account.emailAddress}"),
      Divider(color: Colors.grey),
      spacedText("Phone Number", "${account.phoneNumber}"),
      Divider(color: Colors.grey),
      spacedText("Billing Address", "${account.billingAddress.address}"),
      spacedText("",
          "${account.billingAddress.city}, ${account.billingAddress.state} ${account.billingAddress.zipcode}"),
      Divider(color: Colors.grey),
      spacedText("Date Joined",
          "${account.dateJoined.month}/${account.dateJoined.day}/${account.dateJoined.year}"),
      Divider(color: Colors.grey),
      spacedText("Phone Number", "${account.phoneNumber}"),
      Divider(color: Colors.grey),
      spacedText(
          "Membership Type", "${account.membership.membershipTypeToString()}"),
    ];
  }
}
