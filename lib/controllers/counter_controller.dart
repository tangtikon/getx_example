import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt count = RxInt(0);

  void addCounter() {
    count += 1;
  }
}
