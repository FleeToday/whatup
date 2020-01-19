import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatup/resources/Repository.dart';
import 'package:whatup/screens/HomeScreen/HomeScreen.dart';
import 'package:whatup/screens/LoginScreen/bloc/login_bloc.dart';
import 'package:whatup/screens/LoginScreen/bloc/login_event.dart';
import 'package:whatup/screens/LoginScreen/bloc/login_state.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(Repository()),
      child: LoginModule(),
    );
  }
}

class LoginModule extends StatefulWidget {
  const LoginModule({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginModuleState();
  }
}

class _LoginModuleState extends State<LoginModule> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errMsg = "";
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
    return BlocListener<LoginBloc, LoginState>(listener: (context, state) {
      if (state is LoginFailure) {
        setState(() {
          _errMsg = state.errMsg;
        });
      } else {
        setState(() {
          _errMsg = "";
        });
      }
      if (state is LoginSuccess) {
        Route route = MaterialPageRoute(builder: (context) => HomeScreen());
        Navigator.pushReplacement(context, route);
      }
    }, child: BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return LoginForm(
          emailController: _emailController,
          passwordController: _passwordController,
          state: state,
          onSignInButtonPress: _onSignInButtonPress,
          errMsg: _errMsg,
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

  void _onSignInButtonPress() {
    _loginBloc.add(
      Submitted(
          email: _emailController.text, password: _passwordController.text),
    );
  }
}

class LoginLoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Container(
          child: Text('Loading'),
          margin: EdgeInsets.all(16),
        )
      ],
    ));
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    @required TextEditingController emailController,
    @required TextEditingController passwordController,
    @required Function onSignInButtonPress,
    @required LoginState state,
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
  final LoginState _state;
  final String _errMsg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
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
                )
              ],
            ),
            Container(
              height: 300,
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
                          height: 50,
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
                            child: const Text('Sign In',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w200)),
                            alignment: Alignment.center,
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
