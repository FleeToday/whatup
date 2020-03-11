import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:whatup/components/NeumorConcaveContainer.dart';
import 'package:whatup/components/NeumorFlatContainer.dart';
import 'package:whatup/main.dart';
import 'package:whatup/models/UserProfile.dart';
import 'package:whatup/screens/LoginScreen/bloc/auth_bloc.dart';
import 'package:whatup/screens/LoginScreen/bloc/auth_event.dart';
import 'package:whatup/screens/LoginScreen/bloc/auth_state.dart';
import 'package:whatup/screens/ProfileScreen/CreateProfileScreen.dart';
import 'package:whatup/screens/ProfileScreen/bloc/userProfile_bloc.dart';
import 'package:whatup/screens/ProfileScreen/bloc/userProfile_event.dart';
import 'package:whatup/screens/ProfileScreen/bloc/userProfile_state.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserProfileBloc, UserProfileState>(
        listener: (BuildContext context, UserProfileState state) {},
        child: BlocBuilder<UserProfileBloc, UserProfileState>(
            builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              color: mainColor,
            ),
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
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
                      child: NeumorFlatContainer(
                        borderRadius: BorderRadius.circular(60),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                NeumorFlatContainer(
                                  borderRadius: BorderRadius.circular(60),
                                  child: Container(
                                    padding: EdgeInsets.all(2),
                                    child: NeumorConcaveContainer(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(60),
                                      child: IconButton(
                                          icon: Icon(
                                              MaterialCommunityIcons
                                                  .account_outline,
                                              size: 20,
                                              color: Colors.white)),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        (state is UserProfileRetrievalSuccess)
                                            ? '${state.currentUserProfile.firstName} ${state.currentUserProfile.lastName}'
                                            : state.toString(),
                                        style: TextStyle(
                                            // color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w200),
                                      ),
                                      Text(
                                        (state is UserProfileRetrievalSuccess)
                                            ? state.currentUserProfile.email
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
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                    ),
                    FlatButton(
                      padding: EdgeInsets.all(0.0),
                      onPressed: () =>
                          {BlocProvider.of<AuthBloc>(context).add(SignOut())},
                      child: NeumorFlatContainer(
                        borderRadius: BorderRadius.circular(60),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                NeumorFlatContainer(
                                  borderRadius: BorderRadius.circular(60),
                                  child: Container(
                                    padding: EdgeInsets.all(2),
                                    child: NeumorConcaveContainer(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(60),
                                      child: IconButton(
                                          icon: Icon(
                                              MaterialCommunityIcons
                                                  .arrow_expand_right,
                                              size: 20,
                                              color: Colors.white)),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Sign Out',
                                        style: TextStyle(
                                            // color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w200),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
