import 'package:flutter/material.dart';

void main(List<String> args) => runApp(const Main());

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SettingScreen(),
    );
  }
}

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late final String name;
  late final String email;

  @override
  Widget build(BuildContext context) {
    email = 'testEmail';
    name = 'testName';
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ProfileBox(email: email, name: name),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                EntryButton(text: 'test', onPress: () {}),
                EntryButton(text: 'test', onPress: () {}),
                EntryButton(text: 'test', onPress: () {}),
                SignOutButton(name: name)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProfileBox extends StatelessWidget {
  const ProfileBox({super.key, required this.name, required this.email});

  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 10, 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Account',
              style: TextStyle(
                fontSize: 15,
              )),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                )),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                Text(email),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EntryButton extends StatelessWidget {
  const EntryButton({super.key, required this.text, required this.onPress});

  final Function onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                child: Row(children: [
                  Text(text,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      )),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 20,
                  )
                ]),
                onPressed: () {
                  onPress();
                }),
            const Divider(
              color: Colors.grey,
              height: 1,
            )
          ],
        ));
  }
}

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(20, 50, 20, 0),
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            side: const BorderSide(width: 1.0, color: Colors.red),
          ),
          onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                      content: Text('Sign out of $name?',
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('cancel')),
                        TextButton(
                            onPressed: () {},
                            child: const Text('Sign out',
                                style: TextStyle(color: Colors.red))),
                      ])),
          child: const Text('Sign out', style: TextStyle(color: Colors.red))),
    );
  }
}
