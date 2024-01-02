import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:getx_example/controllers/counter_controller.dart';

class CounterPage extends StatelessWidget {
  CounterPage({Key? key}) : super(key: key);
  final counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetX<CounterController>(
        init: CounterController(),
        initState: (_) {},
        builder: (_) {
          return Center(
            child: Text("${_.count}"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.addCounter();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
