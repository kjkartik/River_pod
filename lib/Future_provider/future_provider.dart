


Future<String> fetchdata() async {
  return await Future.delayed(const Duration(seconds: 5), () async {
    var data = 1;
    for (var i = 0; i < 10; i++) {
      data = i;
    }
    return data.toString();
  });
}
