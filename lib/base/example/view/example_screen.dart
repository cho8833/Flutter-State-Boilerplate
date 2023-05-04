import 'package:flutter/material.dart';
import 'package:pf_flutter_template/base/example/model/example_model.dart';
import 'package:pf_flutter_template/base/example/provider/example_provider.dart';
import 'package:pf_flutter_template/base/provider/base_provider.dart';
import 'package:pf_flutter_template/base/view/status_builder.dart';
import 'package:provider/provider.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({Key? key}) : super(key: key);

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Generic 에 사용할 provider 의 타입을 꼭 명시해줘야한다
        body: StatusBuilder<ExampleProvider>(
          loadData: (context) {
            ExampleProvider provider = context.read<ExampleProvider>();
            provider.testGetData();
          },
          // Callback 함수 파라미터의 타입은 꼭 (BuildContext, BaseProvider) 로 명시해줘야함
          successBuilder: (BuildContext context, BaseProvider provider) {
            // Flutter 제네릭의 문제인지,
            // successBuilder(BuildContext context , ExampleProvider provider) 로 사용하고 싶지만
            // Type Exception 이 발생하여 BaseProvider 로 받아온 후 사용할 provider 로 Casting.
            ExampleProvider exampleProvider = provider as ExampleProvider;
            List<ExampleModel> dataList = exampleProvider.data;

            return ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) => Text(provider.data[index].example),
            );
          },

          // optional
          failBuilder: (context) => const Text("Failed!"),

          // optional
          loadingBuilder: (context) => const Text("loading"),

          // optional
          idleBuilder: (context) => const Text("idle"),
        ));
  }
}


