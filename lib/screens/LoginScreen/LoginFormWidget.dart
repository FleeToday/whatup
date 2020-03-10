import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:whatup/components/NeumorConcaveContainer.dart';
import 'package:whatup/components/NeumorConvexContainer.dart';
import 'package:whatup/components/NeumorFlatContainer.dart';
import 'package:whatup/main.dart';
import 'package:whatup/screens/LoginScreen/LoginLoadingViewWidget.dart';
import 'package:whatup/screens/LoginScreen/bloc/auth_state.dart';
import 'package:whatup/utilities/NeumorFlatDecoration.dart';
import 'package:whatup/utilities/PrimaryGradientDecoration.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    @required TextEditingController emailController,
    @required TextEditingController passwordController,
    @required Function onSignInButtonPress,
    @required AuthState state,
    @required String errMsg,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        _onSignInButtonPress = onSignInButtonPress,
        _state = state,
        _errMsg = errMsg,
        super();

  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final Function _onSignInButtonPress;
  final AuthState _state;
  final String _errMsg;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20, left: 32, right: 32),
              padding: EdgeInsets.all(20),
              child: (_state is AuthLoading)
                  ? LoginLoadingView()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        NeumorFlatContainer(
                          borderRadius: BorderRadius.circular(50),
                          child: NeumorConvexContainer(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              height: 60,
                              padding: EdgeInsets.all(4),
                              child: NeumorConcaveContainer(
                                borderRadius: BorderRadius.circular(50),
                                child: Container(
                                  padding: EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: TextFormField(
                                    style: TextStyle(fontSize: 14),
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Phone No.',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 15,
                        ),
                        NeumorFlatContainer(
                          borderRadius: BorderRadius.circular(50),
                          child: NeumorConvexContainer(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              height: 60,
                              padding: EdgeInsets.all(4),
                              child: NeumorConcaveContainer(
                                borderRadius: BorderRadius.circular(50),
                                child: Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: TextFormField(
                                            style: TextStyle(fontSize: 14),
                                            controller: _passwordController,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              labelText: 'Verification Code',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 12.0),
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          alignment: Alignment.center,
                                          child: NeumorFlatContainer(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              child: Container(
                                                padding: EdgeInsets.all(2),
                                                child: NeumorConcaveContainer(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  child: IconButton(
                                                      icon: Icon(
                                                          MaterialCommunityIcons
                                                              .message,
                                                          size: 20,
                                                          color: Colors.white)),
                                                ),
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Center(
                            child: Text(''
                                // _errMsg,
                                ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(16.0),
                          child: FlatButton(
                            onPressed: _onSignInButtonPress,
                            padding: const EdgeInsets.all(0.0),
                            color: Colors.transparent,
                            child: NeumorFlatContainer(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(28)),
                              child: Container(
                                padding: const EdgeInsets.all(12.0),
                                child: const Text('Sign In',
                                    style: TextStyle(
                                        // color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w200)),
                                alignment: Alignment.center,
                              ),
                              // ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            NeumorFlatContainer(
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  child: NeumorConcaveContainer(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(30),
                                    child: IconButton(
                                        icon: Icon(
                                            MaterialCommunityIcons.facebook,
                                            size: 20,
                                            color: Colors.white)),
                                  ),
                                )),
                            Container(
                              width: 20,
                            ),
                            NeumorFlatContainer(
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  child: NeumorConcaveContainer(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(30),
                                    child: IconButton(
                                        icon: Icon(
                                            MaterialCommunityIcons.google,
                                            size: 20,
                                            color: Colors.white)),
                                  ),
                                )),
                          ],
                        )
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
