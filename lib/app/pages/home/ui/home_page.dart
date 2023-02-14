import 'package:oren/app/feature_a/presentation/input_form_page.dart';
import 'package:oren/app/feature_a/presentation/simple_home_page.dart';
import 'package:oren/app/feature_a/presentation/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oren/app/pages/home/controller/home_page_controller.dart';
import '../../../../l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';


class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // GetIt.I.registerSingleton(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text('hello'.tr),
              Obx(() => Text("${AppLocalizations.of(context)?.increment} : ${controller.currentValue.value}"),),
              ElevatedButton(onPressed: () => controller.increment(), child: const Text("Increment")),
              ElevatedButton(onPressed: () => Get.to(SimpleHomePage()), child: const Text("Simple Home Page")),
              ElevatedButton(onPressed: () => Get.to(const InputFormPage()), child: const Text("Input Form")),
              ElevatedButton(onPressed: () => Get.to( WelcomeScreen()), child: const Text("Welcome Screen"))
            ],
          ),
        ),
      ),
    );
  }
}
