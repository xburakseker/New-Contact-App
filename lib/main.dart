import 'package:contactswithgetx/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controller/getx_controller.dart';
import 'controller/messages.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      darkTheme: ThemeData.dark().copyWith(backgroundColor: Colors.red),
      translations: Messages(),
      title: 'contactsapp'.tr,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'contactsapp'.tr),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});
  final String title;

  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('contactsapp'.tr),
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: IconButton(
              icon: Icon(Icons.language),
              onPressed: () {
                controller.temaDegistir();
              },
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'language'.tr,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Obx(
              () => DropdownButton<String>(
                value: controller.dropDownValue.toString(),
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                onChanged: (String? value) {
                  controller.dropDownValue.value = value!;
                  if (value == "Türkçe") {
                    Get.updateLocale(const Locale("tr", "TR"));
                  } else if (value == "English") {
                    Get.updateLocale(const Locale("en", "EN"));
                  } else {
                    Get.updateLocale(const Locale("de", "DE"));
                  }
                },
                items: controller.dropDownItems.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: TextField(
                controller: controller.controllerName,
                onChanged: (value) {},
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'name'.tr,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: TextField(
                maxLength: 10,
                controller: controller.controllerNumber,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (value) {},
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'number'.tr,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: ElevatedButton(
                  onPressed: () {
                    controller.save();
                    //  Get.to(Home());
                  },
                  child: Text('done'.tr)),
            ),
          ],
        ),
      ),
    );
  }
}
