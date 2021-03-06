import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatup/components/DotsIndicator.dart';
import 'package:whatup/models/Hobby.dart';
import 'package:whatup/screens/ProfileScreen/HobbyPageWidget.dart';
import 'package:whatup/screens/ProfileScreen/NameQuestionPageWidget.dart';
import 'package:whatup/screens/ProfileScreen/QuestionCardWidget.dart';
import 'package:whatup/screens/ProfileScreen/bloc/userProfile_bloc.dart';
import 'package:whatup/screens/ProfileScreen/bloc/userProfile_event.dart';
import 'package:whatup/screens/ProfileScreen/bloc/userProfile_state.dart';

class CreateProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CreateProfileScreenState();
  }
}

class CreateProfileScreenState extends State<CreateProfileScreen> {
  PageController _pageController;
  TextEditingController _firstNameController;
  TextEditingController _lastNameController;
  bool isNameFilled = false;
  List<Hobby> _selectedHobbies = [];
  bool isHobbiesChanged = false;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _pageController = PageController();
  }

  void _onFirstNameChanged(String firstName) {
    // setState(() {
    //   isNameFilled = _firstNameController.text.isNotEmpty &&
    //       _lastNameController.text.isNotEmpty;
    // });
  }

  void _onLastNameChanged(String lastName) {
    // setState(() {
    //   isNameFilled = _firstNameController.text.isNotEmpty &&
    //       _lastNameController.text.isNotEmpty;
    // });
  }

  void _onBlur() {
    print("onBlur");
    setState(() {
      isNameFilled = _firstNameController.text.isNotEmpty &&
          _lastNameController.text.isNotEmpty;
    });
  }

  void _onToggleHobby(Hobby hobby) {
    this.setState(() {
      // if (this._selectedHobbies.contains(hobby)) {
      bool isRemove = this._selectedHobbies.remove(hobby);
      // }
      if (!isRemove) this._selectedHobbies.add(hobby);
      isHobbiesChanged = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
        builder: (context, state) {
      if (state is UserProfileRetrievalSuccess) {
        _firstNameController.text = state.currentUserProfile.firstName;
        _lastNameController.text = state.currentUserProfile.lastName;
        isNameFilled = _firstNameController.text.isNotEmpty &&
            _lastNameController.text.isNotEmpty;
        if (!this.isHobbiesChanged) {
          _selectedHobbies = [...state.currentUserProfile.hobbies];
        }
      }
      return Container(
        child: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "A Few More Steps for Better Matches...",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: Theme.of(context)
                            .primaryTextTheme
                            .headline
                            .fontSize),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    child: PageView(
                      controller: _pageController,
                      children: <Widget>[
                        QuestionCardWidget(
                          isCardCompleted: isNameFilled,
                          child: NameQuestionPageWidget(
                            firstNameController: _firstNameController,
                            lastNameController: _lastNameController,
                          ),
                        ),
                        QuestionCardWidget(
                          child: HobbyPageWidget(
                            selectedHobbies: this._selectedHobbies,
                            onToggleHobby: this._onToggleHobby,
                          ),
                          isCardCompleted: false,
                        ),
                        QuestionCardWidget(
                          isCardCompleted: false,
                        ),
                      ],
                    ),
                  ),
                ),
                DotsIndicator(
                  itemCount: 3,
                  controller: _pageController,
                  color: Theme.of(context).primaryColorLight,
                ),
                FlatButton(
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    onPressed: () {
                      BlocProvider.of<UserProfileBloc>(context).add(
                          CreateUserProfile(
                              firstName: _firstNameController.text,
                              lastName: "",
                              hobbies: this._selectedHobbies));
                      Future.delayed(Duration.zero, () {
                        Navigator.of(context).pop();
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(12.0),
                      margin: EdgeInsets.all(16.0),
                      child: Text(
                        "Skip / Save",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize:
                                Theme.of(context).textTheme.title.fontSize),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                            color: Colors.white,
                            width: 1,
                            style: BorderStyle.solid),
                      ),
                    ))
              ],
            ),
          ),
        ),
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
      );
    });
  }
}
