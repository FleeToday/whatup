import 'package:flutter/material.dart';
import 'package:whatup/screens/LoginScreen/LoginLoadingViewWidget.dart';
import 'package:whatup/screens/LoginScreen/bloc/login_state.dart';

class RegisterFormWidget extends StatelessWidget {
  const RegisterFormWidget({
    @required TextEditingController emailController,
    @required TextEditingController passwordController,
    @required Function onSignUpButtonPress,
    @required LoginState state,
    @required String errMsg,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        _onSignInButtonPress = onSignUpButtonPress,
        _state = state,
        _errMsg = errMsg,
        super();

  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final Function _onSignInButtonPress;
  final LoginState _state;
  final String _errMsg;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: (_state is LoginLoading)
                    ? LoginLoadingView()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Username',
                              ),
                              autovalidate: true,
                              validator: (String value) {
                                return _state.isEmailValid
                                    ? null
                                    : "Invalid Email";
                              }),
                          Container(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            autovalidate: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                            ),
                            validator: (String value) {
                              return _state.isPasswordValid
                                  ? null
                                  : "Invalid Password";
                            },
                          ),
                          Container(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            autovalidate: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Confirm Password',
                            ),
                            validator: (String value) {
                              return _state.isPasswordValid
                                  ? null
                                  : "Invalid Password";
                            },
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                _errMsg,
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: _onSignInButtonPress,
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(0.0),
                            color: Colors.transparent,
                            child: AnimatedContainer(
                              color: _state.isEmailValid &&
                                      _state.isPasswordValid &&
                                      _emailController.text.isNotEmpty &&
                                      _passwordController.text.isNotEmpty
                                  ? Colors.blue[800]
                                  : Colors.blue[300],
                              duration: Duration(milliseconds: 500),
                              padding: const EdgeInsets.all(10.0),
                              child: const Text('Sign Up',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w200)),
                              alignment: Alignment.center,
                            ),
                          ),
                        ],
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
