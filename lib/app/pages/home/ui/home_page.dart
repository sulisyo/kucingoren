import 'dart:ffi';

import 'package:asphalt_aloha/asphalt_aloha.dart';
import 'package:barcode/barcode.dart';
import 'package:common_widgets/common_widgets.dart';
import 'package:oren/app/core/app_routes.dart';
import 'package:oren/app/feature_a/presentation/bevel_button_widget.dart';
import 'package:oren/app/feature_a/presentation/empty_home/sample_empty_home.dart';
import 'package:oren/app/feature_a/presentation/input_form_page.dart';
import 'package:oren/app/feature_a/presentation/simple_home_page.dart';
import 'package:oren/app/feature_a/presentation/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oren/app/pages/home/controller/home_page_controller.dart';
import 'package:tagihan/tagihan.dart';
import '../../../../l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatelessWidget {
  HomePageController controller = GetIt.I<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0xE5, 0xE5, 0xE5),
      appBar: AppBar(
        title: Text('Hello'),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(45),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text('hello'.tr),
                  const SizedBox(height: 24),
                  Obx(
                    () => Text(
                        "${AppLocalizations.of(context)?.increment} : ${controller.currentValue.value}"),
                  ),
                  const SizedBox(height: 24),
                  AlohaPillButton.highlighted(
                    onTap: () => controller.increment(),
                    text: const Text("Increment"),
                    state: AlohaButtonState.active,
                  ),
                  const SizedBox(height: 24),
                  AlohaPillButton.regular(
                    onTap: () => navigate(context, Paths.SIMPLE_HOME),
                    text: const Text("Simple Home Page"),
                    state: AlohaButtonState.active,
                  ),
                  const SizedBox(height: 24),
                  AlohaSecondaryButton.positive(const Text("Input Form"),
                      onTap: () => navigate(context, Paths.INPUT_FORM)),
                  const SizedBox(height: 24),
                  AlohaTertiaryButton.positive(
                    const Text("Welcome Screen"),
                    onTap: () => navigate(context, Paths.WELCOME),
                  ),
                  const SizedBox(height: 24),
                  AlohaPrimaryButton.positive(
                    const Text("Complex Home"),
                    onTap: () => navigate(context, Paths.COMBO_HOME),
                  ),
                  const SizedBox(height: 24),
                  TagihanContextualCtaWidget.neutral(
                    title: 'View complete analysis here ',
                    deeplink: 'eeeeee',
                    source: TagihanSource.tagihanHomeSource,
                    imageName: "ic_topup_categories_one.svg",
                    contextualAdd: false,
                    onTap: () => {},
                  ),
                  const SizedBox(height: 24),
                  AlohaIcon(
                    icon: IconName.navigation24Next,
                    color: AlohaTheme.of(context).colors.fillActivePrimary,
                  ),
                  const SizedBox(height: 24),
                  AlohaPrimaryButton.positive(
                    const Text("Join Promotion"),
                    onTap: () => navigate(context, Paths.COMBO_HOME),
                  ),
                  const SizedBox(height: 24),
                  AlohaPrimaryButton.contextual(
                    const Text("Transfer"),
                    onTap: () => navigate(context, Paths.COMBO_HOME),
                    infoText: Text('Rp1.002.500'),
                    icon: AlohaIcon(
                      icon: IconName.communication24SendChat,
                    ),
                    descriptionText: 'No admin fee',
                  ),
                  const SizedBox(height: 24),
                  AlohaSecondaryButton.positive(const Text("Cancel"),
                      size: AlohaButtonSize.tiny,
                      onTap: () => navigate(context, Paths.INPUT_FORM)),
                  const SizedBox(height: 24),
                  AlohaPillButton.highlighted(
                    onTap: () => controller.increment(),
                    text: const Text("Text"),
                    state: AlohaButtonState.active,
                    icon: AlohaIcon(
                      icon: IconName.actions16Info,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TagihanContextualCtaWidget.primary(
                    title: 'Strengthen your protection here',
                    deeplink: 'eeeeee',
                    source: TagihanSource.tagihanHomeSource,
                    imageName: "cashout_sharing_secure.svg",
                    contextualAdd: false,
                    rightIcon: false,
                    onTap: () => {},
                  ),
                  const SizedBox(height: 24),
                  AlohaPrimaryButton.positive(
                    const Text("Promo toko"),
                    size: AlohaButtonSize.tiny,
                    onTap: () => navigate(context, Paths.COMBO_HOME),
                  ),
                  const SizedBox(height: 24),
                  AccountHomeBannerWidget(
                    bannerData: BannerData(
                        title: 'fsadfasdfsdaf',
                        illustration: Illustration.agentMiniSpotKtp,
                        action: (data) => {}),
                    source: "source",
                  ),
                  const SizedBox(height: 24),
                  ContextualCtaWidget.active(
                    title: "title",
                    onCtaClicked: () => {},
                    illustration: Illustration.agentMiniSpotKtp,
                    trailingIcon: IconName.actions16Info,
                  ),
                  const SizedBox(height: 24),
                  Container(
                    decoration:
                        getBoxCardDecoration(context, CardDecoration.none),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: BarcodeGeneratorWidget(
                        data: 'dfdfdf ini ibu budi',
                        barcode: Barcode.qrCode(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 500,
                    child: GopayTabWidget(
                      initialIndex: 0,
                      items: [
                        GopayTabBarItem(
                            title: "title1",
                            child: Container(
                              child: AlohaIcon(
                                icon: IconName.actions16Info,
                              ),
                              decoration: getBoxCardDecoration(
                                  context, CardDecoration.card),
                            ),
                            activeIcon: IconName.actions16Info),
                        GopayTabBarItem(
                            title: "title2",
                            child: Container(
                              child: AlohaIcon(
                                icon: IconName.communication24SendChat,
                              ),
                              decoration: getBoxCardDecoration(
                                  context, CardDecoration.card),
                            ),
                            activeIcon: IconName.communication24SendChat),
                      ],
                      currentIndexCallback: (index) {},
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(height: 33, child: InstructionListWidget()),
                  const SizedBox(height: 24),
                  SizedBox(height: 73, child: CommonLoadingWidget())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void navigate(BuildContext context, String route) {
    Navigator.of(context).push(AppRoutes.getRoute(context, route));
  }
}
