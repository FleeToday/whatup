import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatup/components/KeyboardAvoidingView.dart';
import 'package:whatup/components/NeumorConcaveContainer.dart';
import 'package:whatup/components/NeumorConvexContainer.dart';
import 'package:whatup/components/NeumorFlatContainer.dart';
import 'package:whatup/main.dart';
import 'package:whatup/resources/Repository.dart';
import 'package:whatup/screens/HomeScreen/HomeScreen.dart';
import 'package:whatup/screens/LoginScreen/LoginFormWidget.dart';
import 'package:whatup/screens/LoginScreen/RegisterFormWidget.dart';
import 'package:whatup/screens/LoginScreen/bloc/auth_bloc.dart';
import 'package:whatup/screens/LoginScreen/bloc/auth_event.dart';
import 'package:whatup/screens/LoginScreen/bloc/auth_state.dart';
import 'package:whatup/screens/ProfileScreen/CreateProfileScreen.dart';
import 'package:whatup/screens/ProfileScreen/bloc/userProfile_bloc.dart';
import 'package:whatup/screens/ProfileScreen/bloc/userProfile_event.dart';
import 'package:whatup/screens/ProfileScreen/bloc/userProfile_state.dart';

const Color backgroundColor = Color.fromRGBO(225, 225, 250, 1);

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginModule();
  }
}

class LoginModule extends StatefulWidget {
  const LoginModule({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginModuleState();
  }
}

class _LoginModuleState extends State<LoginModule> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final PageController _pageController = PageController(
    viewportFraction: 1,
    keepPage: true,
  );
  bool isConfirmPasswordErr = false;
  int _currentIndex = 0;

  AuthBloc _authBloc;
  UserProfileBloc _userProfileBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _userProfileBloc = BlocProvider.of<UserProfileBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
    _confirmPasswordController.addListener(_onConfirmPasswordChanged);
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiBlocListener(
      listeners: [
        BlocListener<UserProfileBloc, UserProfileState>(
            listener: (context, state) {
          if (state is UserProfileRetrievalSuccess) {
            Future.delayed(Duration.zero, () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            });
          }
          if (!state.isUserProfileCompleted || !state.isUserProfileExist) {
            Future.delayed(Duration.zero, () {
              Navigator.push(
                  context,
                  MaterialPageRoute<Null>(
                    builder: (BuildContext context) {
                      return CreateProfileScreen();
                    },
                    fullscreenDialog: true,
                  ));
            });
          }
        }),
        BlocListener<AuthBloc, AuthState>(listener: (context, state) {
          if (state is AuthSuccess) {
            _userProfileBloc.add(RetrieveUserProfile(state.user.uid));
          }
        })
      ],
      child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        final height = MediaQuery.of(context).size.height;

        final width = MediaQuery.of(context).size.width;

        return Scaffold(
            body: Container(
          color: mainColor,
          child: KeyboardAvoidingView(
            child: Stack(
              children: <Widget>[
                Column(
                  children: [
                    Flexible(
                      flex: 39,
                      child: Container(
                        width: 1000,
                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
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
                      ),
                    ),
                    Flexible(
                      flex: 61,
                      child: Container(
                        color: mainColor,
                      ),
                    )
                  ],
                ),
                SafeArea(
                  child: Container(
                    height: height,
                    width: width,
                    child: Stack(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Flexible(
                              flex: 3,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 200,
                                    width: 200,
                                    margin: EdgeInsets.only(top: 16),
                                    child: Stack(
                                        alignment: Alignment.bottomLeft,
                                        children: [
                                          Image(
                                              image: AssetImage(
                                                'assets/whatup_logo.png',
                                              ),
                                              color: Colors.white),
                                          Container(
                                            margin: EdgeInsets.all(24),
                                            alignment: Alignment.bottomLeft,
                                            child: Text(
                                              'whatup',
                                              style: TextStyle(
                                                fontFamily: 'ArialRoundedBold',
                                                color: Colors.white,
                                              ),
                                            ),
                                          )
                                        ]),
                                  ),
                                  NeumorFlatContainer(
                                    borderRadius: BorderRadius.circular(50),
                                    child: NeumorConvexContainer(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Container(
                                        height: 45,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 6, vertical: 6),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            this._currentIndex != 0
                                                ? FlatButton(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .horizontal(
                                                              left: Radius
                                                                  .circular(
                                                                      100)),
                                                    ),
                                                    child: Text(
                                                      "Sign In",
                                                      // style: TextStyle(color: Colors.white),
                                                    ),
                                                    onPressed:
                                                        (_currentIndex != 0)
                                                            ? () => {
                                                                  _pageController
                                                                      .animateToPage(
                                                                    0,
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            400),
                                                                    curve: Curves
                                                                        .easeInOutCirc,
                                                                  )
                                                                }
                                                            : null,
                                                  )
                                                : NeumorConcaveContainer(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Theme.of(context)
                                                            .primaryColorDark,
                                                        Theme.of(context)
                                                            .primaryColor
                                                      ],
                                                      stops: [0, 1],
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.horizontal(
                                                            left:
                                                                Radius.circular(
                                                                    100)),
                                                    child: FlatButton(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius: BorderRadius
                                                            .horizontal(
                                                                left: Radius
                                                                    .circular(
                                                                        20)),
                                                      ),
                                                      child: Text(
                                                        "Sign In",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      onPressed:
                                                          (_currentIndex != 0)
                                                              ? () => {
                                                                    _pageController
                                                                        .animateToPage(
                                                                      0,
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              400),
                                                                      curve: Curves
                                                                          .easeInOutCirc,
                                                                    )
                                                                  }
                                                              : null,
                                                    )),
                                            this._currentIndex != 1
                                                ? FlatButton(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .horizontal(
                                                              right: Radius
                                                                  .circular(
                                                                      100)),
                                                    ),
                                                    child: Text(
                                                      "Sign Up",
                                                      // style: TextStyle(color: Colors.white),
                                                    ),
                                                    onPressed:
                                                        (_currentIndex != 1)
                                                            ? () => {
                                                                  _pageController
                                                                      .animateToPage(
                                                                    1,
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            400),
                                                                    curve: Curves
                                                                        .easeInOutCirc,
                                                                  )
                                                                }
                                                            : null,
                                                  )
                                                : NeumorConcaveContainer(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Theme.of(context)
                                                            .primaryColorDark,
                                                        Theme.of(context)
                                                            .primaryColor
                                                      ],
                                                      stops: [0, 1],
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.horizontal(
                                                            right:
                                                                Radius.circular(
                                                                    100)),
                                                    child: FlatButton(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius: BorderRadius
                                                            .horizontal(
                                                                right: Radius
                                                                    .circular(
                                                                        20)),
                                                      ),
                                                      child: Text(
                                                        "Sign Up",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      onPressed:
                                                          (_currentIndex != 1)
                                                              ? () => {
                                                                    _pageController
                                                                        .animateToPage(
                                                                      0,
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              400),
                                                                      curve: Curves
                                                                          .easeInOutCirc,
                                                                    )
                                                                  }
                                                              : null,
                                                    )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 400,
                                    child: PageView(
                                      onPageChanged: _onPageChanged,
                                      controller: _pageController,
                                      children: <Widget>[
                                        LoginFormWidget(
                                          emailController: _emailController,
                                          passwordController:
                                              _passwordController,
                                          state: state,
                                          onSignInButtonPress:
                                              _onSignInButtonPress,
                                          errMsg: (state is AuthFailure)
                                              ? state.errMsg
                                              : '',
                                        ),
                                        RegisterFormWidget(
                                          confirmPasswordController:
                                              _confirmPasswordController,
                                          emailController: _emailController,
                                          passwordController:
                                              _passwordController,
                                          state: state,
                                          onSignUpButtonPress:
                                              _onSignUpButtonPress,
                                          errMsg: (state is AuthFailure)
                                              ? state.errMsg
                                              : isConfirmPasswordErr
                                                  ? 'The two passwords are the same'
                                                  : '',
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
      }),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _authBloc.add(
      EmailChanged(email: _emailController.text),
    );
  }

  void _onConfirmPasswordChanged() {
    isConfirmPasswordErr =
        _passwordController.text != _confirmPasswordController.text;
  }

  void _onPasswordChanged() {
    _authBloc.add(
      PasswordChanged(password: _passwordController.text),
    );
  }

  void _onSignUpButtonPress() {
    _authBloc.add(
      SignUpSubmitted(
          email: _emailController.text, password: _passwordController.text),
    );
  }

  void _onSignInButtonPress() {
    _authBloc.add(
      SignInSubmitted(
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
