import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/getx_controller.dart';

class Home extends StatelessWidget {
  Home({super.key});

  Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: 1,
        shrinkWrap: false,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: Row(children: [
              Container(
                width: 50,
                height: 25,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.grey),
                child: Text(controller.name.toString()),
              ),
            ]),
          );
        },
      ),
    ));
  }
}
