import 'package:flutter/material.dart';

class RoundedCornerImage extends StatelessWidget {
  const RoundedCornerImage({Key? key, required this.path}) : super(key: key);

  final String path;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        child: Image.asset(path));
  }
}

class CircleImage extends StatelessWidget {
  const CircleImage({Key? key, required this.path}) : super(key: key);

  final String path;

  @override
    Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundImage: AssetImage(path),
    );
  }
}
