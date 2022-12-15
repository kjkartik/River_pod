import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/SteamProvider/stream_provider.dart';

class streamUI extends StatelessWidget {
  const streamUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Stream UI"),
      ),
      body: Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) { 
       var asyncvalue = ref.watch(numbercount);

        return  asyncvalue.when(data: (data){
          print("data 2 " );
          return Center(child: Text(data.toString(),style: TextStyle(fontSize: 28),));
        }, error: (e,stack){
          return Text(e.toString());
        }, loading:(){
         return Center(child: CircularProgressIndicator(),);
        });
      },
      ),
    );
  }
}
