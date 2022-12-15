import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/pattern/state.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../model.dart';

class UI extends StatefulWidget {
  const UI({Key? key}) : super(key: key);

  @override
  State<UI> createState() => _UIState();
}

class _UIState extends State<UI> {
  @override
  Widget build(BuildContext context) {
    // connectToServer();

    // print("----->builder "+ data.price.toString());
    final ramdomnumber = ChangeNotifierProvider((ref) => RandomizerChangeNotifier());
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {

            final randomized  = ref.watch(ramdomnumber);
            return InkWell(
              child: Text(randomized._generatedNumber.toString()),
              onTap: () {
                

                print("ontap");


              },
            );
          },
        ),
      ),
      body: Column(
        children: [
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              GetJson state = ref.watch(postProvider);
              if (state is InitialData) {
                return Center(child: Text("Initial Data"));
              }

              if (state is Loading) {
                return CircularProgressIndicator();
              }

              if (state is Loaded) {
                return SizedBox(
                  height: 700,
                  child: ListView.builder(
                      itemCount: state.posts.data!.uSDT!.length,
                      itemBuilder: (context, index) {
                        return Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:  Column(
                            children: [
                              Text(state.posts.data!.uSDT![index].price
                                  .toString()),

                            ],
                          ),
                        ));
                      }),
                );
              }
              return Text("No Data Found");
            },
          ),

          Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final data = ref.watch(myNotifierprovider);
            print(data.price.toString());
            return Text(data.price.toString());
          }),
        ],
      ),
    );
  }
}

final _provider = ProviderContainer().read(myNotifierprovider);

connectToServer() {
  WebSocketChannel channelHome = IOWebSocketChannel.connect(
    Uri.parse('wss://stream.binance.com:9443/ws/stream?'),
  );

  var subRequestHome = {
    'method': "SUBSCRIBE",
    'params': tickerList,
    'id': 1,
  };

  var jsonString = json.encode(subRequestHome);
  channelHome.sink.add(jsonString);
  var result = channelHome.stream.transform(
    StreamTransformer<dynamic, dynamic>.fromHandlers(
      handleData: (number, sink) {
        sink.add(number);
      },
    ),
  );
  result.listen((event) {
    var snapshot = jsonDecode(event);
    _provider.updateData(snapshot['s'].toString(), snapshot['c'].toString(),
        snapshot['P'].toString());
  });
}

final myNotifierprovider = ChangeNotifierProvider<UpdatePrice>((ref) {
  return UpdatePrice();
});

class UpdatePrice extends ChangeNotifier {
  String price = "kartik--";

  void updateData(s, c, p) {
    print(price.length.toString());

    price = c.toString();

    notifyListeners();

    print("price " + price.toString());
  }
}

List<String> tickerList = [
  "btcusdt@ticker",
  "ethusdt@ticker",
  "winusdt@ticker",
  "dentusdt@ticker",
  "xrpusdt@ticker",
  "etcusdt@ticker",
  "dogeusdt@ticker",
  "bnbusdt@ticker",
  "yfiusdt@ticker",
  "cakeusdt@ticker",
  "vetusdt@ticker",
  "maticusdt@ticker",
  "trxusdt@ticker",
  "eosusdt@ticker",
  "usdcusdt@ticker",
  "neoeth@ticker",
  "xmrbtc@ticker",
  "wintrx@ticker",
  "yfiiusdt@ticker",
  "aaveusdt@ticker",
  "dotusdt@ticker",
  "sandusdt@ticker",
  "maticbtc@ticker",
  "polybtc@ticker",
  "yfiibtc@ticker",
  "bnbbtc@ticker",
  "yfibtc@ticker",
  "aavebtc@ticker",
  "ltcbtc@ticker",
  "cakebtc@ticker",
  "eosbtc@ticker",
  "jstbtc@ticker",
  "chzbtc@ticker",
  "polybtc@ticker",
  "solbtc@ticker",
  "ksmbtc@ticker",
  "compbtc@ticker",
  "dashbtc@ticker",
  "axsbtc@ticker",
  "btgbtc@ticker",
  "lunabtc@ticker",
  "dasheth@ticker",
  "avaxeth@ticker",
  "axseth@ticker",
  "etceth@ticker",
  "doteth@ticker",
  "linketh@ticker",
  "omgeth@ticker",
  "sandeth@ticker",
  "waveseth@ticker",
  "nanoeth@ticker",
  "ezeth@ticker",
  "manaeth@ticker",
  "enjeth@ticker",
  "lsketh@ticker",
  "aaveeth@ticker",
  "mtleth@ticker",
  "adaeth@ticker",
  "iotaeth@ticker",
  "xrpeth@ticker",
  "shibusdt@ticker",
];

final Counter = ChangeNotifierProvider<RandomizerChangeNotifier>(
    (ref) => RandomizerChangeNotifier());

class RandomizerChangeNotifier extends ChangeNotifier {
  final _randomGenerator = Random();

  int? _generatedNumber;

  int? get incrementCounte => _generatedNumber;
  int min =0, max =0;
  void generateRandomNumber() {
    _generatedNumber = min + _randomGenerator.nextInt(max +1 - min);
    notifyListeners();
  }
}
