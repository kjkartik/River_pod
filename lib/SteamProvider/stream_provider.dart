import 'package:flutter_riverpod/flutter_riverpod.dart';

final numbercount = StreamProvider<int>((ref) =>  fetchNumber());

Stream<int> fetchNumber() {
  print("data1");
  return Stream<int>.periodic(Duration(seconds: 2), (number) {
    print("data3 ");
    return number;
  })
      .take(100);
}
