import 'package:flutter/material.dart';
import 'package:whatup/components/NeumorConcaveContainer.dart';
import 'package:whatup/components/NeumorConvexContainer.dart';
import 'package:whatup/components/NeumorFlatContainer.dart';

class NeumorTextField extends StatelessWidget {
  NeumorTextField(
      {this.controller,
      this.labelText,
      this.style,
      this.width,
      this.height,
      this.onSaved,
      this.onTap});

  TextEditingController controller;
  String labelText;
  TextStyle style;
  double height;
  double width;
  Function onSaved;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return NeumorFlatContainer(
      borderRadius: BorderRadius.circular(50),
      child: NeumorConvexContainer(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          height: this.height,
          width: this.width,
          padding: EdgeInsets.all(4),
          child: NeumorConcaveContainer(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: TextFormField(
                onSaved: this.onSaved,
                onTap: this.onTap,
                style: TextStyle(fontSize: 14),
                controller: this.controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: this.labelText,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
