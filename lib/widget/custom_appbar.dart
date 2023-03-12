import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const CustomAppBarExample());
}

class CustomAppBarExample extends StatelessWidget {
  const CustomAppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(appBarObj: AppBar()),
      ),
    );
  }
}

/// get AppBar Widget for setting height
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.appBarObj}) : super(key: key);

  final AppBar appBarObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: preferredSize.height,
      child: Row(
        children: [
          Container(
              padding: const EdgeInsets.only(left: 20),
              child: const Text(
                'Title',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )),
          const Spacer(),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarObj.preferredSize.height);
}
