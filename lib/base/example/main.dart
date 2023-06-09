import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pf_flutter_template/base/example/provider/impl/example_provider_impl.dart';
import 'package:pf_flutter_template/base/example/repository/impl/example_repository_impl.dart';
import 'package:pf_flutter_template/base/example/view/example_screen.dart';
import 'package:pf_flutter_template/base/provider/base_provider.dart';
import 'package:pf_flutter_template/base/view/status_builder.dart';
import 'package:provider/provider.dart';

import 'provider/example_provider.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ChangeNotifierProvider<ExampleProvider>(
            create: (BuildContext context) =>
                ExampleProviderImpl(ExampleRepositoryImpl(Client())),
            child: const ExampleScreen()));
  }
}