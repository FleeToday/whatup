import 'package:flutter/material.dart';

class QuestionCardWidget extends StatelessWidget {
  final Widget child;
  final bool isCardCompleted;

  const QuestionCardWidget({Key key, this.child, this.isCardCompleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
          margin: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 8, right: 8),
                    decoration: BoxDecoration(
                        color:
                            isCardCompleted ? Colors.green[300] : Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    padding: EdgeInsets.all(4),
                    child: Icon(
                      isCardCompleted
                          ? Icons.check_circle
                          : Icons.remove_circle,
                      size: 30,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: child,
              )
            ],
          )),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: Theme.of(context).primaryColorLight,
                width: 2,
                style: BorderStyle.solid),
            color: Colors.white,
          )),
    );
  }
}
