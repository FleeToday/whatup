import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatup/resources/Repository.dart';
import 'package:whatup/screens/HomeScreen/HomeScreen.dart';
import 'package:whatup/screens/LoginScreen/LoginFormWidget.dart';
import 'package:whatup/screens/LoginScreen/RegisterFormWidget.dart';
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
  final PageController _pageController = PageController(
    viewportFraction: 1,
    keepPage: true,
  );
  int _currentIndex = 0;

  LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocListener<LoginBloc, LoginState>(listener: (context, state) {
      if (state is LoginSuccess) {
        Route route = MaterialPageRoute(builder: (context) => HomeScreen());
        Navigator.pushReplacement(context, route);
      }
    }, child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Scaffold(
          body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        child: Text("Sign In"),
                        onPressed: (_currentIndex != 0)
                            ? () => {
                                  _pageController.animateToPage(
                                    0,
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeInOutCirc,
                                  )
                                }
                            : null,
                      ),
                      FlatButton(
                        child: Text("Sign Up"),
                        onPressed: (_currentIndex != 1)
                            ? () => {
                                  _pageController.animateToPage(
                                    1,
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeInOutCirc,
                                  )
                                }
                            : null,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 3,
              child: PageView(
                onPageChanged: _onPageChanged,
                controller: _pageController,
                children: <Widget>[
                  LoginFormWidget(
                    emailController: _emailController,
                    passwordController: _passwordController,
                    state: state,
                    onSignInButtonPress: _onSignInButtonPress,
                    errMsg: (state is LoginFailure) ? state.errMsg : '',
                  ),
                  RegisterFormWidget()
                ],
              ),
            )
          ],
        ),
      ));
    }));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _pageController.dispose();
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
