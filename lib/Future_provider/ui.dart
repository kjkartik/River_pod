import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/Future_provider/future_provider.dart';

final weatherProvider = FutureProvider<String>((ref) => fetchdata());

class FutureProviderUI extends StatelessWidget {
  const FutureProviderUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Provider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return ref.watch(weatherProvider).when(
                data: (data) {
                  return Center(child: Text(data.toString()));
                },
                error: (e, stack) {
                  return Text(e.toString());
                },
                loading: () {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
