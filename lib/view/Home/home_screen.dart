import 'package:auction/controller/count_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<CountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetX<CountController>(
      init: CountController(),
      builder: (_) => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Counter : ${_.count.value}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () => _.increment(),
              child: const Text("Increase", style: TextStyle(fontSize: 24)),
            ),
            ElevatedButton(
              onPressed: () => _.decrement(),
              child: const Text("decrease", style: TextStyle(fontSize: 24)),
            )
          ],
        ),
      ),
    ));
  }
}
