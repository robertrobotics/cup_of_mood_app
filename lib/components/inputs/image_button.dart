import 'package:flutter/material.dart';

class ImageButton extends StatefulWidget {
  final Image image;
  final Function onButtonTapHandler;

  const ImageButton({Key key, @required this.image, this.onButtonTapHandler})
      : super(key: key);

  @override
  _ImageButtonState createState() => _ImageButtonState();
}

class _ImageButtonState extends State<ImageButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.onButtonTapHandler,
        child: widget.image,
      ),
    );
  }
}
