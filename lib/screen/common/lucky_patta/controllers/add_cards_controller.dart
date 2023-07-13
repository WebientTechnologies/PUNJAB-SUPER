import 'package:get/get.dart';

class AddCardsController extends GetxController {
  var cardsChosen = [].obs;
  var minutes = 0.obs;
  var seconds = 30.obs;

  void addSelectedCardValueToList(
    int value,
    double x,
    double y,
    int index,
    String family,
  ) {
    if (value == 0) return;

    int cardIndex =
        cardsChosen.indexWhere((element) => element['cardNumber'] == index);
    if (cardIndex == -1) {
      cardsChosen.add(
        {
          'cardNumber': index,
          'points': value,
          'family': family,
          'x': x,
          'y': y,
        },
      );
    } else {
      var card = cardsChosen[cardIndex];
      card['points'] += value;
      cardsChosen[cardIndex] = card;
    }
  }

  void clear() {
    cardsChosen.clear();
    minutes.value = 2;
    seconds.value = 30;
  }

  void decrementTimer() {
    if (seconds.value == 0) {
      seconds.value = 59;
      minutes.value--;
    } else {
      seconds.value--;
    }
  }
}
