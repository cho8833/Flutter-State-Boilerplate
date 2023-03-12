import 'package:flutter/material.dart';

/// Center Image Splash Screen
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  
  final double width = 100;
  final double height = 100;
  final Color bgColor = Colors.white;
  final String filePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: Center(
            child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: width,
                    height: height,
                    child: CenterLogo(filePath: filePath),
                    )
              ],
            ),
            const Positioned(
              bottom: 50,
              child: BottomLogo(),
            )
          ],
        )));
  }
}

class CenterLogo extends StatelessWidget {
  const CenterLogo({super.key, required this.filePath});

  final String filePath;

  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage(filePath));
  }
}

class BottomLogo extends StatelessWidget {
  const BottomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}