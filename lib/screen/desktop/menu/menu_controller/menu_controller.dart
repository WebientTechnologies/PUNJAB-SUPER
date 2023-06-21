import 'package:get/get.dart';
import 'package:punjabsuper/screen/desktop/menu/models/menu_model.dart';

class MenuController extends GetxController {
  RxList recievables = <MenuModel>[].obs;
  RxList transferabels = <MenuModel>[].obs;

  void loadTransfereables() {
    transferabels.add(
      MenuModel(
        accountNumber: '123456789',
        amount: 1000,
        type: 'G',
      ),
    );
    transferabels.add(
      MenuModel(
        accountNumber: '123456789',
        amount: 1000,
        type: 'E',
      ),
    );
    transferabels.add(
      MenuModel(
        accountNumber: '123456789',
        amount: 1000,
        type: 'H',
      ),
    );
    transferabels.add(
      MenuModel(
        accountNumber: '123456789',
        amount: 1000,
        type: 'B',
      ),
    );
    transferabels.add(
      MenuModel(
        accountNumber: '123456789',
        amount: 1000,
        type: 'F',
      ),
    );
    transferabels.add(
      MenuModel(
        accountNumber: '123456789',
        amount: 1000,
        type: 'A',
      ),
    );
  }

  void loadRecievables() {
    recievables.add(
      MenuModel(
        accountNumber: '123456789',
        amount: 1000,
        type: 'G',
      ),
    );
    recievables.add(
      MenuModel(
        accountNumber: '123456789',
        amount: 1000,
        type: 'E',
      ),
    );
    recievables.add(
      MenuModel(
        accountNumber: '123456789',
        amount: 1000,
        type: 'H',
      ),
    );
    recievables.add(
      MenuModel(
        accountNumber: '123456789',
        amount: 1000,
        type: 'B',
      ),
    );
    recievables.add(
      MenuModel(
        accountNumber: '123456789',
        amount: 1000,
        type: 'F',
      ),
    );
    recievables.add(
      MenuModel(
        accountNumber: '123456789',
        amount: 1000,
        type: 'K',
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    loadRecievables();
    loadTransfereables();
  }
}
