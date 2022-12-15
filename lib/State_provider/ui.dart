import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/State_provider/ui2.dart';

class StateProviderUI extends StatefulWidget {
  const StateProviderUI({Key? key}) : super(key: key);

  @override
  State<StateProviderUI> createState() => _StateProviderUIState();
}

class _StateProviderUIState extends State<StateProviderUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer(builder: (context, ref, widget) {
            print("eeeës");
            final data = ref.watch(boolProvider);

            return Column(
              children: [
                InkWell(
                    onTap: () {
                      ref.read(boolProvider.notifier).update((state) => true);
                    },
                    child: Center(
                        child: Text(
                      data.toString(),
                      style: const TextStyle(color: Colors.red, fontSize: 40),
                    ))),
                InkWell(
                  child: Text("Next PAge"),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => StateProviderUI2()));
                  },
                )
              ],
            );
          })
        ],
      ),
    );
  }
}

final boolProvider = StateProvider<bool>((ref) => false);
