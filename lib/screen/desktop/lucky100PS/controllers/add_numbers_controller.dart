import 'package:get/get.dart';

class AddNumbersController extends GetxController {
  var combinations = [].obs;
  var points = 0.obs;
  var totalNumbers = 0.obs;
  var totalValue = 0.obs;

  void calculateCombineMaker(valueA, points) {
    if (valueA.isNotEmpty) {
      var temp = valueA.split('');
      combinations = [].obs;
      for (var i = 0; i < temp.length; i++) {
        for (var j = 0; j < temp.length; j++) {
          var number = temp[i] + temp[j];
          int index = combinations.indexWhere((element) => element == number);
          if (index == -1) {
            combinations.add({
              'number': number,
              'points': int.parse(points),
            });
          } else {
            combinations[index]['points'] += int.parse(points);
          }
        }
      }
      // showToast(combinations.toString());
      // print(combinations);
      if (points.isEmpty) {
        points = '1';
      }
      this.points = points;
      totalNumbers.value = combinations.value.length;
      totalValue.value = int.parse(points.value) * totalNumbers.value;
    }
  }

  void calculateJodiMakers(valueA, valueB, points) {
    if (valueA.isNotEmpty && valueB.isNotEmpty) {
      var temp = valueA.split('');
      var temp1 = valueB.split('');
      combinations = [].obs;
      for (var i = 0; i < temp.length; i++) {
        for (var j = 0; j < temp1.length; j++) {
          var number = temp[i] + temp1[j];
          int index = combinations.indexWhere((element) => element == number);
          if (index == -1) {
            combinations.add({
              'number': number,
              'points': int.parse(points),
            });
          } else {
            combinations[index]['points'] += int.parse(points);
          }
        }
      }
      // showToast(combinations.toString());
      if (points.isEmpty) {
        points = '1';
      }
      // print(combinations);
      this.points.value = points;
      totalNumbers.value = combinations.length;
      totalValue.value = int.parse(points.value) * totalNumbers.value;
    }
  }
}
