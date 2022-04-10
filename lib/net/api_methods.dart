// https://api.coingecko.com/api/v3/coins

import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<double> getPrice(String id) async {
  try {
    var url = "https://api.coingecko.com/api/v3/simple/price?ids=" +
        id +
        "&vs_currencies=usd";
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    print(response.body);

    var value = json[id]['usd'].toString();
    log(value);
    return double.parse(value);
  } catch (e) {
    print(e.toString());
    return 0.0;
  }
}
