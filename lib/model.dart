class CoinModel {
  String? statusCode;
  String? statusText;
  String? message;
  Data? data;
  List<String>? tickers;
  List<String>? listedTickers;

  CoinModel(
      {this.statusCode,
        this.statusText,
        this.message,
        this.data,
        this.tickers,
        this.listedTickers});

  CoinModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    statusText = json['status_text'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    tickers = json['tickers'].cast<String>();
    listedTickers = json['listed_tickers'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['status_text'] = this.statusText;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['tickers'] = this.tickers;
    data['listed_tickers'] = this.listedTickers;
    return data;
  }
}

class Data {
  List<USDT>? uSDT;
  List<BTC>? bTC;


  Data({this.uSDT, this.bTC, });

  Data.fromJson(Map<String, dynamic> json) {
    if (json['USDT'] != null) {
      uSDT = <USDT>[];
      json['USDT'].forEach((v) {
        uSDT!.add(new USDT.fromJson(v));
      });
    }
    if (json['BTC'] != null) {
      bTC = <BTC>[];
      json['BTC'].forEach((v) {
        bTC!.add(new BTC.fromJson(v));
      });
    }


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.uSDT != null) {
      data['USDT'] = this.uSDT!.map((v) => v.toJson()).toList();
    }
    if (this.bTC != null) {
      data['BTC'] = this.bTC!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class USDT {
  String? image;
  String? symbol;
  String? flag;
  bool? listed;
  int? id;
  String? name;
  String? currency;
  String? pairWith;
  String? decimalCurrency;
  String? decimalPair;
  String? buyMinDesc;
  String? buyMaxDesc;
  String? buyDesc;
  String? sellMinDesc;
  String? sellMaxDesc;
  String? sellDesc;
  String? createdAt;
  String? updatedAt;
  String? price;
  String? change;
  var volume;
  String? high;
  String? low;
  String? startPrice;
  String? currentPrice;

  USDT(
      {this.image,
        this.symbol,
        this.flag,
        this.listed,
        this.id,
        this.name,
        this.currency,
        this.pairWith,
        this.decimalCurrency,
        this.decimalPair,
        this.buyMinDesc,
        this.buyMaxDesc,
        this.buyDesc,
        this.sellMinDesc,
        this.sellMaxDesc,
        this.sellDesc,
        this.createdAt,
        this.updatedAt,
        this.price,
        this.change,
        this.volume,
        this.high,
        this.low,
        this.startPrice,
        this.currentPrice});

  USDT.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    symbol = json['symbol'];
    flag = json['flag'];
    listed = json['listed'];
    id = json['id'];
    name = json['name'];
    currency = json['currency'];
    pairWith = json['pair_with'];
    decimalCurrency = json['decimal_currency'];
    decimalPair = json['decimal_pair'];
    buyMinDesc = json['buy_min_desc'];
    buyMaxDesc = json['buy_max_desc'];
    buyDesc = json['buy_desc'];
    sellMinDesc = json['sell_min_desc'];
    sellMaxDesc = json['sell_max_desc'];
    sellDesc = json['sell_desc'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    price = json['price'];
    change = json['change'];
    volume = json['volume'];
    high = json['high'];
    low = json['low'];
    startPrice = json['start_price'];
    currentPrice = json['current_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['symbol'] = this.symbol;
    data['flag'] = this.flag;
    data['listed'] = this.listed;
    data['id'] = this.id;
    data['name'] = this.name;
    data['currency'] = this.currency;
    data['pair_with'] = this.pairWith;
    data['decimal_currency'] = this.decimalCurrency;
    data['decimal_pair'] = this.decimalPair;
    data['buy_min_desc'] = this.buyMinDesc;
    data['buy_max_desc'] = this.buyMaxDesc;
    data['buy_desc'] = this.buyDesc;
    data['sell_min_desc'] = this.sellMinDesc;
    data['sell_max_desc'] = this.sellMaxDesc;
    data['sell_desc'] = this.sellDesc;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['price'] = this.price;
    data['change'] = this.change;
    data['volume'] = this.volume;
    data['high'] = this.high;
    data['low'] = this.low;
    data['start_price'] = this.startPrice;
    data['current_price'] = this.currentPrice;
    return data;
  }
}

class BTC {
  String? image;
  String? symbol;
  String? flag;
  bool? listed;
  int? id;
  String? name;
  String? currency;
  String? pairWith;
  String? decimalCurrency;
  String? decimalPair;
  String? buyMinDesc;
  String? buyMaxDesc;
  String? buyDesc;
  String? sellMinDesc;
  String? sellMaxDesc;
  String? sellDesc;
  String? createdAt;
  String? updatedAt;
  String? price;
  String? change;
  String? volume;
  String? high;
  String? low;

  BTC(
      {this.image,
        this.symbol,
        this.flag,
        this.listed,
        this.id,
        this.name,
        this.currency,
        this.pairWith,
        this.decimalCurrency,
        this.decimalPair,
        this.buyMinDesc,
        this.buyMaxDesc,
        this.buyDesc,
        this.sellMinDesc,
        this.sellMaxDesc,
        this.sellDesc,
        this.createdAt,
        this.updatedAt,
        this.price,
        this.change,
        this.volume,
        this.high,
        this.low});

  BTC.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    symbol = json['symbol'];
    flag = json['flag'];
    listed = json['listed'];
    id = json['id'];
    name = json['name'];
    currency = json['currency'];
    pairWith = json['pair_with'];
    decimalCurrency = json['decimal_currency'];
    decimalPair = json['decimal_pair'];
    buyMinDesc = json['buy_min_desc'];
    buyMaxDesc = json['buy_max_desc'];
    buyDesc = json['buy_desc'];
    sellMinDesc = json['sell_min_desc'];
    sellMaxDesc = json['sell_max_desc'];
    sellDesc = json['sell_desc'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    price = json['price'];
    change = json['change'];
    volume = json['volume'];
    high = json['high'];
    low = json['low'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['symbol'] = this.symbol;
    data['flag'] = this.flag;
    data['listed'] = this.listed;
    data['id'] = this.id;
    data['name'] = this.name;
    data['currency'] = this.currency;
    data['pair_with'] = this.pairWith;
    data['decimal_currency'] = this.decimalCurrency;
    data['decimal_pair'] = this.decimalPair;
    data['buy_min_desc'] = this.buyMinDesc;
    data['buy_max_desc'] = this.buyMaxDesc;
    data['buy_desc'] = this.buyDesc;
    data['sell_min_desc'] = this.sellMinDesc;
    data['sell_max_desc'] = this.sellMaxDesc;
    data['sell_desc'] = this.sellDesc;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['price'] = this.price;
    data['change'] = this.change;
    data['volume'] = this.volume;
    data['high'] = this.high;
    data['low'] = this.low;
    return data;
  }
}
