import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:getx_test/getx_test.dart';

void main() {
  getTest(
    "independent widget test",
    widgetTest: (tester) async {
      expect('/', Get.currentRoute);

      Get.to(Container());
      expect('/Container', Get.currentRoute);

      Get.to(Scaffold());
      expect('/Scaffold', Get.currentRoute);

      Get.back();

      expect('/Container', Get.currentRoute);
    },
  );

  testGetX(
    'GetX test',
    widget: GetX<Controller>(
      init: Controller(),
      builder: (controller) {
        return Text("ban:${controller.count}");
      },
    ),
    test: (e) {
      expect(find.text("ban:0"), findsOneWidget);
      expect(e.count.value, 0);
    },
  );

  testGetBuilder(
    'GetBuilder test',
    widget: GetBuilder<Controller>(
      init: Controller(),
      builder: (controller) {
        return Text("Clicks:${controller.count}");
      },
    ),
    test: (e) {
      expect(find.text("Clicks:0"), findsOneWidget);
      expect(e.count.value, 0);
    },
  );

  testObx(
    'Obx test',
    widget: (controller) => Obx(
      () => Text("Clicks:${controller.count}"),
    ),
    controller: Controller(),
    test: (e) {
      expect(find.text("Clicks:0"), findsOneWidget);
      expect(e.count.value, 0);
    },
  );

  testController<Controller>(
    'Controller test',
    (controller) {},
    controller: Controller(),
    onInit: (c) {
      c.increment();
      print('onInit');
    },
    onReady: (c) {
      print('onReady');
      c.increment();
    },
    onClose: (c) {
      print('onClose');
    },
  );
}

class Controller extends GetxController {
  final count = 0.obs;
  void increment() => count.value++;

  @override
  void onInit() {
    print('onInit in Controller called');
    super.onInit();
  }

  @override
  void onReady() {
    print('onReady in Controller called');
    super.onReady();
  }

  void onClose() {
    print('onClose in Controller called');
  }
}
