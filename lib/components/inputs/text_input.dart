import 'package:cup_of_mood_mobile/constants.dart';
import 'package:flutter/material.dart';

class TextBox extends StatefulWidget {
  final TextInputType textInputType;
  final TextInputAction keyboardAction;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final String defaultText;
  final Widget prefixIcon;
  final Function functionValidate;
  final String parametersValidate;
  final Function onSubmitField;
  final Function onFieldTap;
  final bool obscureText;

  const TextBox(
      {Key key,
      @required this.hintText,
      @required this.controller,
      this.keyboardAction = TextInputAction.next,
      this.obscureText = false,
      this.textInputType,
      this.focusNode,
      this.defaultText,
      this.prefixIcon,
      this.functionValidate,
      this.parametersValidate,
      this.onSubmitField,
      this.onFieldTap})
      : super(key: key);

  @override
  _TextBoxState createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  double defaultPadding = 14;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: kGoldenPrimaryColor),
      child: TextFormField(
        controller: widget.controller,
        cursorColor: kGoldenPrimaryColor,
        obscureText: widget.obscureText,
        keyboardType: widget.textInputType,
        textInputAction: widget.keyboardAction,
        focusNode: widget.focusNode,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
            fontSize: 24.0,
            fontFamily: 'RobotoLight',
            letterSpacing: 1.2,
            color: kGoldenPrimaryColor),
        initialValue: widget.defaultText,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: kGoldenPrimaryColor.withOpacity(0.8),
            fontSize: 20.0,
            fontFamily: 'RobotoLight',
            letterSpacing: 1.5,
          ),
          contentPadding: EdgeInsets.only(
              left: 30.0, top: defaultPadding, bottom: defaultPadding),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kGoldenPrimaryColor, width: 2),
              borderRadius: BorderRadius.circular(55.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kGoldenPrimaryColor, width: 2),
              borderRadius: BorderRadius.circular(55.0)),
        ),
      ),
    );
  }
}
