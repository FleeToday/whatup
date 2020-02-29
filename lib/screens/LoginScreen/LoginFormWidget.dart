import 'package:flutter/material.dart';
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
              margin: EdgeInsets.only(top: 20, left: 16, right: 16),
              padding: EdgeInsets.all(20),
              decoration: NeumorFlatDecoration(
                // color: Colors.white,
                color: mainColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
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
                                      labelText: 'Username',
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
                                  padding: EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: TextFormField(
                                    style: TextStyle(fontSize: 14),
                                    controller: _passwordController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Password',
                                    ),
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
                              // color: Theme.of(context).primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(28)),
                              child: NeumorConvexContainer(
                                // color: Theme.of(context).primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(28)),
                                child: Container(
                                  decoration:
                                      getPrimaryGradientBoxDecoration(context),
                                  padding: const EdgeInsets.all(12.0),
                                  child: const Text('Sign In',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w200)),
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
