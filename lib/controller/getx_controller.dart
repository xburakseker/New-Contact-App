import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../theme.dart';

class Controller extends GetxController {
  RxList<String> dropDownItems = ["English", "Türkçe", "Deutsch"].obs;
  RxString dropDownValue = "English".obs;
  RxBool isDark = false.obs;
  GetStorage getStorage = GetStorage();
  RxList name = [].obs;
  RxList number = [].obs;

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerNumber = TextEditingController();

  @override
  void onInit() {
    dropDownValue.value = dropDownItems.first;
    bool deger = getStorage.read("isDark") ?? false;
    deger ? Get.changeTheme(themeDatadark()) : Get.changeTheme(themeDataLight());

    super.onInit();
  }

  save() {
    for (var i = 0; i < number.length; i++) {
      if (number[i] != controllerNumber.text) {
        number.add(controllerNumber.text);
        print(number);
      }
    }

    name.add(controllerName.text);
    print(number);
  }

  temaDegistir() {
    isDark.value = !isDark.value;

    isDark.value ? Get.changeTheme(themeDatadark()) : Get.changeTheme(themeDataLight());
    temaKaydet(isDark.value);
  }

  temaKaydet(bool deger) {
    getStorage.write("isDark", deger);
  }
}
