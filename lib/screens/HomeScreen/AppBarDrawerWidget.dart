import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatup/screens/LoginScreen/bloc/auth_bloc.dart';
import 'package:whatup/screens/LoginScreen/bloc/auth_event.dart';
import 'package:whatup/screens/LoginScreen/bloc/auth_state.dart';
import 'package:whatup/screens/ProfileScreen/bloc/userProfile_bloc.dart';
import 'package:whatup/screens/ProfileScreen/bloc/userProfile_event.dart';

class AppBarDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (BuildContext context, AuthState state) {},
        child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.66,
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
                                bottom: BorderSide(
                                    width: 1, color: Colors.grey[300]))),
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 16),
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
                                children: <Widget>[
                                  Text(""),
                                  Text(
                                    (state is AuthSuccess)
                                        ? state.user.email
                                        : state.toString(),
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      FlatButton(
                        onPressed: () =>
                            {BlocProvider.of<AuthBloc>(context).add(SignOut())},
                        shape: Border(
                            bottom:
                                BorderSide(width: 1, color: Colors.grey[300])),
                        padding:
                            EdgeInsets.symmetric(horizontal: 36, vertical: 12),
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
        }));
  }
}
