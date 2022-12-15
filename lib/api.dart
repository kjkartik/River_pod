import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:river_pod/model.dart';

class GetCoinList {

 static Future<CoinModel> getCoinData() async {
  String api = "https://server.justbit.co.in/list-crypto/get";
    var response = await http.get(Uri.parse(api));

    if (response.statusCode.toString() == "200") {
      return CoinModel.fromJson(jsonDecode(response.body));
    } else {
      return null!;
    }
  }
}

final userProvider = Provider<GetCoinList>((ref){

 return GetCoinList();

},);
