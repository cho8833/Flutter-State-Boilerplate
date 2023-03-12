import 'package:flutter/material.dart';
import 'package:pf_flutter_template/base/provider/base_provider.dart';
import 'package:pf_flutter_template/base/status.dart';
import 'package:provider/provider.dart';

class StatusBuilder<P extends BaseProvider> extends StatefulWidget {
  const StatusBuilder(
      {Key? key,
      this.failBuilder,
      this.loadingBuilder,
      required this.successBuilder,
      required this.loadData,
      this.idleBuilder})
      : super(key: key);

  final Widget Function(BuildContext context, P provider) successBuilder;
  final Widget Function(BuildContext)? failBuilder;
  final Widget Function(BuildContext)? loadingBuilder;
  final Widget Function(BuildContext)? idleBuilder;

  /// load data function after building widget(initState)
  ///
  /// * 만약 어떤 provider 에서 데이터를 불러오는 함수를 실행시켜야 한다면,
  /// provider 는 listen: false 로 참조해야한다.
  ///
  /// * example
  /// loadData: Provider.of<SomeProvider>(context, listen: false).loadAnyData;
  /// loadData: context.read<SomeProvider>().loadAnyData;
  final void Function(BuildContext) loadData;

  @override
  State<StatusBuilder> createState() => _StatusBuilderState<P>();
}

class _StatusBuilderState<P extends BaseProvider> extends State<StatusBuilder> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() => widget.loadData(context));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<P>(
      builder: (context, provider, child) {
        return () {
          switch (provider.status) {
            case Status.success:
              return widget.successBuilder(context, provider);
            case Status.loading:
              return widget.loadingBuilder != null
                  ? Builder(builder: widget.loadingBuilder!)
                  : const CircularProgressIndicator();
            case Status.fail:
              return widget.failBuilder != null
                  ? Builder(builder: widget.failBuilder!)
                  : Center(child: Text(provider.errorMessage ?? "failed"));
            case Status.idle:
              return widget.idleBuilder != null
                  ? Builder(builder: widget.idleBuilder!)
                  : Container();
          }
        }();
      }
    );
  }
}
