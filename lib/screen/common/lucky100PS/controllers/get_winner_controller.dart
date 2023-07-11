import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../utils/api_endpoints.dart';

class GetWinnerController extends GetxController {
  RxInt winner = 0.obs;
  RxList getLastWinnersList = [].obs;

  void getLastWinners({
    String betId = "10",
    int betType = 0,
  }) async {
    String url = "$urlEndPoint/getLastWinners";
    var body = {
      "betId": betId,
      "betType": betType,
      "count": 10,
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

      if (res.statusCode == 200) {
        // print(res.body);
        var result = json.decode(res.body)['result'];
        for (var i in result) {
          getLastWinnersList.value.add(i['winningNumber']);
        }
      }
      print(getLastWinnersList.value);
    } catch (e) {
      print(e);
    }
  }

  void getWinner({String betId = "abcdefrg", required int betType}) async {
    String url = "$urlEndPoint/getWinner";
    var body = {
      "betId": betId,
      "betType": betType,
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

      if (res.statusCode == 200) {
        // print(res.body);
        var value = json.decode(res.body)['result']['winningNumber'];
        // print(value);
        winner.value = value;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getWinner(
      betType: 0,
    );

    getLastWinners(
      betType: 0,
    );
  }
}
