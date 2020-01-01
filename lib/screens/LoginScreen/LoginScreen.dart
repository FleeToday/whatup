import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: 
              Column(
                children: [
                  Text('Welcome to Whatup', style: TextStyle(fontWeight: FontWeight.w200, fontSize: 36, color: Colors.black87, ), ),
                  Text('Sign in to continue', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black87, ), ),
                  Container(height: 36,),
                  Container(
                    margin: EdgeInsets.only(bottom: 24),
                    child: Column(children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                        ),
                      ),
                      Container(height: 12,),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ],) 
                  ),
                  FlatButton(
                    onPressed: () { 
          Navigator.of(context)
            .popAndPushNamed('/');},
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    color: Colors.transparent,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200)
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        ),
    ); 
  }
}