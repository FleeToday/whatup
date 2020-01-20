import 'package:flutter/material.dart';
import 'package:whatup/screens/LoginScreen/LoginScreen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Route route = MaterialPageRoute(builder: (context) => LoginScreen());
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1, color: Colors.grey[300]))),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.account_circle,
                        size: 48,
                        color: Theme.of(context).primaryColor,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[Text("Username"), Text("Email")],
                        ),
                      ),
                    ],
                  ),
                ),
                FlatButton(
                  onPressed: () => {Navigator.pushReplacement(context, route)},
                  shape: Border(
                      bottom: BorderSide(width: 1, color: Colors.grey[300])),
                  padding: EdgeInsets.symmetric(horizontal: 36, vertical: 12),
                  child: Row(children: [
                    Icon(
                      Icons.exit_to_app,
                      size: 24,
                      color: Theme.of(context).accentColor,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text("Sign out")),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
