import 'package:asphalt_aloha/asphalt_aloha.dart';
import 'package:oren/app/core/app_routes.dart';
import 'package:oren/app/feature_a/presentation/empty_home/sample_empty_home.dart';
import 'package:oren/app/feature_a/presentation/input_form_page.dart';
import 'package:oren/app/feature_a/presentation/simple_home_page.dart';
import 'package:oren/app/feature_a/presentation/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oren/app/pages/home/controller/home_page_controller.dart';
import '../../../../l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';


class HomePage extends StatelessWidget {
  HomePageController controller = GetIt.I<HomePageController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text('hello'.tr),
              const SizedBox(height: 24),
              Obx(() => Text("${AppLocalizations.of(context)?.increment} : ${controller.currentValue.value}"),),
              const SizedBox(height: 24),
              AlohaPillButton.highlighted(onTap: () => controller.increment(), text: const Text("Increment"), state: AlohaButtonState.active,),
              const SizedBox(height: 24),
              AlohaPillButton.regular(onTap: () => navigate(context, Paths.SIMPLE_HOME), text: const Text("Simple Home Page"),state: AlohaButtonState.active,),
              const SizedBox(height: 24),
              AlohaPrimaryButton.positive( const Text("Input Form"), onTap: () => navigate(context, Paths.INPUT_FORM)),
              const SizedBox(height: 24),
              AlohaPrimaryButton.positive(const Text("Welcome Screen"), onTap: () => navigate(context, Paths.WELCOME),),
              const SizedBox(height: 24),
              AlohaPrimaryButton.positive(const Text("Complex Home"), onTap: () => navigate(context, Paths.COMBO_HOME), )
            ],
          ),
        ),
      ),
    );
  }

  void navigate(BuildContext context, String route ){
    Navigator.of(context).push(
      AppRoutes.getRoute(context, route)
    );
  }
}
