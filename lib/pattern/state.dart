import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/pattern/model.dart';

import '../api.dart';
import '../model.dart';


final postProvider = StateNotifierProvider<PostNotifier,GetJson>((ref)=>PostNotifier());


@immutable
abstract class GetJson {}

class InitialData extends GetJson {}

class Loading extends GetJson {}

class Error extends GetJson {
  final error;

  Error({required this.error});
}

class Loaded extends GetJson {
  final CoinModel posts;

  Loaded({required this.posts});
}

class PostNotifier extends StateNotifier<GetJson> {
  PostNotifier() : super(InitialData());

  getData() async {
    state = Loading();
    CoinModel data = await GetCoinList.getCoinData();
    state = Loaded(posts: data);
  }
}

