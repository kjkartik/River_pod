import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/State_provider/ui.dart';

class StateProviderUI2 extends StatefulWidget {
  const StateProviderUI2({Key? key}) : super(key: key);

  @override
  State<StateProviderUI2> createState() => _StateProviderUI2State();
}

class _StateProviderUI2State extends State<StateProviderUI2> {
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
                InkWell(child: Text("BACK  PAge"),onTap: (){
                  Navigator.of(context).pop();
                },)
              ],
            );
          })
        ],
      ),
    );
  }
}

