import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatup/screens/LoginScreen/bloc/login_bloc.dart';
import 'package:whatup/screens/LoginScreen/bloc/login_event.dart';
import 'package:whatup/screens/LoginScreen/bloc/login_state.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: buildLoginForm(context),
    );
  }

  Widget buildLoginForm(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text(
              'Welcome to Whatup',
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 36,
                color: Colors.black87,
              ),
            ),
            Text(
              'Sign in to continue',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            Container(
              height: 36,
            ),
            LoginForm(),
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

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {},
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Material(
              child: Container(
                  child: Column(
                children: <Widget>[
                  TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                      autovalidate: true,
                      validator: (String value) {
                        return state.isEmailValid ? null : "Invalid Email";
                      }),
                  Container(
                    height: 12,
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
                      return state.isPasswordValid ? null : "Invalid Password";
                    },
                  ),
                  Container(
                    height: 30,
                  ),
                  FlatButton(
                    onPressed: () {
                      // Navigator.of(context).popAndPushNamed('/');
                    },
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    color: Colors.transparent,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0)),
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Text('Sign In',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w200)),
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              )),
            );
          },
        ));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _loginBloc.add(
      EmailChanged(email: _emailController.text),
    );
  }

  void _onPasswordChanged() {
    _loginBloc.add(
      PasswordChanged(password: _passwordController.text),
    );
  }
}
