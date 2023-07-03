import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../utils/api_endpoints.dart';

class GetWinnerController extends GetxController {
  RxInt winner = 0.obs;

  void getWinner({String betId = "10"}) async {
    String url = "$urlEndPoint/getWinner";
    var body = {
      "betId": betId,
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
        print(res.body);
        var value = json.decode(res.body)['result']['winningNumber'];
        print(value);
        winner.value = value;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getWinner();
  }
}
