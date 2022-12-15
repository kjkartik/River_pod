import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/pattern/ui.dart';
import 'package:river_pod/repo.dart';

import 'Future_provider/ui.dart';
import 'State_provider/ui.dart';
import 'SteamProvider/streamUi.dart';
import 'notifier_provider/counter.dart';

// A Counter example implemented with riverpod

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home: FutureProviderUI());
  }
}

// final counterProvider = StateProvider<bool>((ref) => true);

class Home1 extends ConsumerWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
            onTap: () {},
                // ref.read(CounterproviderNotifire.notifier).increment(false),
            child: Text("text")),
      ),
      body:    ref.watch(CounterproviderNotifire("kartikd")).when(data: (data){
        return Center(
          child: Center(
            child: Text(
              data.toString(),
              style: TextStyle(fontSize: 28),
            ),
          ),
        );
      }, error: (e,s){
        return Text("error "+e.toString());
      }, loading: (){
        return Center(child: CircularProgressIndicator(),);
      }));


  }
}
