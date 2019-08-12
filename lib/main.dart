import 'package:flutter/material.dart';
import 'package:vt_app/account.dart';
import 'package:vt_app/profile_page.dart';
import 'package:vt_app/search_page.dart';
import 'package:vt_app/sign_in_page.dart';
import 'package:vt_app/dialogs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ving Tsun App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Account currentAccount = null;

  @override
  Widget build(BuildContext context) {
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle), //Replace with profile picture
            onPressed: () {
              (currentAccount != null)
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProfilePage(account: currentAccount)))
                  : Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchPage()));
            },
          ),
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                currentAccount = dummyAccount();
              },
              child: const Text('Sign In to Dummy Account',
                  style: TextStyle(fontSize: 20)),
            ),
            RaisedButton(
              onPressed: () {
                currentAccount = null;
              },
              child:
                  const Text('Sign In to NULL', style: TextStyle(fontSize: 20)),
            ),
            RaisedButton(
              onPressed: () =>
                  Dialogs.information(context, "Dialog Title", "Dialog Text"),
              child: const Text('Dialog Test', style: TextStyle(fontSize: 20)),
            ),
            Image.asset("assets/Ving Tsun Kung Fu Association Americas.png"),
          ],
        ),
      ),
    );
  }
}

Account dummyAccount() {
  return Account(
      firstName: 'First',
      lastName: 'Last',
      profilePicture:
          AssetImage("assets/Ving Tsun Kung Fu Association Americas.png"),
      emailAddress: "example@example.com",
      phoneNumber: "1234567890",
      billingAddress: Address(
          address: "123 Main Street",
          city: "New Brunswick",
          state: "NJ",
          zipcode: "12345"),
      dateJoined: DateTime(2019, 1, 1),
      membership: Membership(
        membershipType: MembershipType.Basic,
        startDate: DateTime.utc(2019, 1, 1),
        endDate: DateTime.utc(2020, 1, 1),
        school: dummySchoolAccount(),
      ));
}

SchoolAccount dummySchoolAccount() {
  return SchoolAccount(schoolName: "Ving Tsun NJ");
}
