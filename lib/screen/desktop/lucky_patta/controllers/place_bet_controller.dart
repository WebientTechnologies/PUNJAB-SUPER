import 'dart:convert';
import 'package:get/get.dart';
import "package:http/http.dart" as http;

import '../../../../../utils/api_endpoints.dart';

class PlaceBetController extends GetxController {
  Future<int> betOkay(List combinations) async {
    String url = "$urlEndPoint/placeBet";
    var body = {
      "agentId": "1234",
      "agentName": "Ishfaq",
      "token": "123445",
      "betId": "abcdefrg",
      "numbersChosen": combinations,
    };
    try {
      var res = await http.post(
        Uri.parse(url),
        body: json.encode(body),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      );

      print(res.body);
      return res.statusCode;
    } catch (e) {
      print('Error is ');
      print(e);
    }
    return -1;
  }
}
