import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatup/models/UserProfile.dart';
import 'package:whatup/screens/LoginScreen/bloc/auth_bloc.dart';
import 'package:whatup/screens/LoginScreen/bloc/auth_event.dart';
import 'package:whatup/screens/LoginScreen/bloc/auth_state.dart';
import 'package:whatup/screens/ProfileScreen/CreateProfileScreen.dart';
import 'package:whatup/screens/ProfileScreen/bloc/userProfile_bloc.dart';
import 'package:whatup/screens/ProfileScreen/bloc/userProfile_event.dart';
import 'package:whatup/screens/ProfileScreen/bloc/userProfile_state.dart';

class AppBarDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserProfileBloc, UserProfileState>(
        listener: (BuildContext context, UserProfileState state) {},
        child: BlocBuilder<UserProfileBloc, UserProfileState>(
            builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.bottomRight,
                begin: Alignment.bottomLeft,
                stops: [
                  0.0,
                  1.0,
                ],
                colors: [
                  Theme.of(context).primaryColorDark,
                  Theme.of(context).primaryColor,
                ],
              ),
            ),
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FlatButton(
                      padding: EdgeInsets.all(0.0),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CreateProfileScreen()));
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.account_circle,
                              size: 48,
                              color: Colors.white,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    (state is UserProfileRetrievalSuccess)
                                        ? '${state.currentUserProfile.firstName} ${state.currentUserProfile.lastName}'
                                        : state.toString(),
                                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200),
                                  ),
                                  Text(
                                    (state is UserProfileRetrievalSuccess)
                                        ? state.currentUserProfile.email
                                        : state.toString(),
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () =>
                          {BlocProvider.of<AuthBloc>(context).add(SignOut())},
                      padding:
                          EdgeInsets.symmetric(horizontal: 36, vertical: 12),
                      child: Row(children: [
                        Icon(
                          Icons.exit_to_app,
                          size: 24,
                          color: Colors.white,
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              "Sign out",
                              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200),
                            )),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
