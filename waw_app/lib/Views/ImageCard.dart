import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final double width;
  final double height;
  final String imageLink;
  final double elevation;

  ImageCard(
      {@required this.width,
      @required this.height,
      @required this.imageLink,
      this.elevation = 7});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: width,
        height: height,
        color: Colors.white,
        child: Image.network(
          imageLink,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
