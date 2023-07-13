import 'package:get/get.dart';

class AddNumbersController extends GetxController {
  var combinations = [].obs;
  var points = 0.obs;
  var totalNumbers = 0.obs;
  var totalValue = 0.obs;
  var minutes = 5.obs;
  var seconds = 0.obs;

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
      this.points.value = int.parse(points);
      totalNumbers.value = combinations.length;
      totalValue.value = int.parse(points) * totalNumbers.value;
    }
  }

  void calculateJodiMakers(valueA, valueB, points) {
    print("Calcculate Jodi Makers");
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
      this.points.value = int.parse(points);
      totalNumbers.value = combinations.length;
      totalValue.value = int.parse(points) * totalNumbers.value;
    }
    print(combinations);
  }

  // void changeJodiMakerCombineMaker(
  //     int index, String valueA, String valueB, points) {
  //   if (index == 1) {
  //     jodiMaker
  //         ? addNumberController.calculateJodiMakers(valueA, valueB, points)
  //         : addNumberController.calculateCombineMaker(valueA, points);
  //   } else {
  //     showCMJMDialog(false);
  //   }
  // }

  void clear() {
    combinations.value = [];
    totalNumbers.value = 0;
    totalValue.value = 0;
    minutes.value = 5;
    seconds.value = 0;
  }
}
