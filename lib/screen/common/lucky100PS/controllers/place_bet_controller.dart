import 'dart:convert';
import 'package:get/get.dart';
import "package:http/http.dart" as http;
import '../../../../utils/api_endpoints.dart';

class PlaceBetController extends GetxController {
  var betList = <Map<String, dynamic>>[].obs();
  void addBet(Map<String, dynamic> bet) {
    betList.add(bet);
  }

  Future<int> betOkay(List combinations) async {
    String url = "$urlEndPoint/placeBet";
    print(url);
    var body = {
      "agentId": "1234",
      "agentName": "Ishfaq",
      "token": "123445",
      "betId": "10",
      "numbersChosen": combinations,
      "betType": 0,
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
