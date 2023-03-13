import 'dart:ffi';

import 'package:asphalt_aloha/asphalt_aloha.dart';
import 'package:barcode/barcode.dart';
import 'package:common_widgets/common_widgets.dart';
import 'package:flutter_svg/svg.dart';
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
                  SizedBox(height: 73, child: CommonLoadingWidget()),
                  const SizedBox(height: 24),
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Your business",
                        style: AlohaTheme.of(context)
                            .textTheme
                            .titleSmallDemiDefault,
                      ),
                    ),
                  ]),
                  Container(
                    decoration:
                        getBoxCardDecoration(context, CardDecoration.top),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              children: [
                                AlohaIcon(
                                  icon: IconName.navigation24Notification,
                                ),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Text(
                                    "Public Business Profile",
                                    style: AlohaTheme.of(context)
                                        .textTheme
                                        .titleTinyDemiDefault,
                                  ),
                                )),
                                AlohaIcon(icon: IconName.navigation24NextIos),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: AlohaDivider(dividerType: DividerType.plain),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration:
                        getBoxCardDecoration(context, CardDecoration.none),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              children: [
                                AlohaIcon(
                                  icon:
                                      IconName.authenticationSecurity24Security,
                                ),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Text(
                                    "Manage Users",
                                    style: AlohaTheme.of(context)
                                        .textTheme
                                        .titleTinyDemiDefault,
                                  ),
                                )),
                                AlohaIcon(icon: IconName.navigation24NextIos),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: AlohaDivider(dividerType: DividerType.plain),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration:
                        getBoxCardDecoration(context, CardDecoration.bottom),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              children: [
                                AlohaIcon(
                                  icon: IconName.communication24Language,
                                ),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Text(
                                    "Manage Store & QR",
                                    style: AlohaTheme.of(context)
                                        .textTheme
                                        .titleTinyDemiDefault,
                                  ),
                                )),
                                AlohaIcon(icon: IconName.navigation24NextIos),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: AlohaDivider(dividerType: DividerType.plain),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Log-in Password",
                        style: AlohaTheme.of(context)
                            .textTheme
                            .titleSmallDemiDefault,
                      ),
                    ),
                  ]),
                  Container(
                    decoration:
                        getBoxCardDecoration(context, CardDecoration.card),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 18.0, left: 18.0),
                                    child: Expanded(
                                      child: Text(
                                        "Enable password Log-in",
                                        style: AlohaTheme.of(context)
                                            .textTheme
                                            .titleTinyDemiDefault,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0, bottom: 18, top: 4),
                                    child: Flexible(
                                      child: Text(
                                        "You will be able to use a password  to\nlog-in with your phone number or\nemail.",
                                        style: AlohaTheme.of(context)
                                            .textTheme
                                            .bodySmallDefault,
                                        maxLines: 4,
                                        softWrap: true,
                                        textAlign: TextAlign.justify,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child:
                              AlohaToggle(value: true, onChanged: (val) => {}),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    decoration:
                        getBoxCardDecoration(context, CardDecoration.card),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 16.0, left: 16, bottom: 16),
                          child: SizedBox(
                            width: 64,
                            height: 64,
                            child: SvgPicture.asset(
                                'assets/image2/gallery_permission.svg'),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 18.0, left: 18.0),
                                    child: Expanded(
                                      child: Text(
                                        "Icon",
                                        style: AlohaTheme.of(context)
                                            .textTheme
                                            .titleTinyDemiDefault,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0, bottom: 18, top: 4),
                                    child: Flexible(
                                      child: Text(
                                        "No Icon added",
                                        style: AlohaTheme.of(context)
                                            .textTheme
                                            .bodySmallDefault,
                                        maxLines: 4,
                                        softWrap: true,
                                        textAlign: TextAlign.justify,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: AlohaSecondaryButton.positive(
                            Text("Edit"),
                            onTap: () {},
                            state: AlohaButtonState.inactive,
                            size: AlohaButtonSize.tiny,
                            leftIcon: AlohaIcon(
                              icon: IconName.actions16Add,
                            ),
                            rightIcon: AlohaIcon(
                              icon: IconName.actions16Add,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    color: AlohaTheme.of(context).colors.fillBackgroundSecondary,  //can't using navbar background color, class is internal
                    child: SvgPicture.asset(
                        'assets/image2/status_bar.svg'),
                  ),
                  AlohaNavBar(
                    decoration: NavBarDecoration.none,
                    navigationIcon: IconName.navigation24Back,
                    onNavigationIconTap: ()=>{},
                    logo: null,
                    titleContainer: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Title",
                                  style: AlohaTheme.of(context)
                                      .textTheme
                                      .titleModerateDemiDefault,
                                ),
                                Text("Subtitle",
                                    style: AlohaTheme.of(context)
                                        .textTheme
                                        .captionSmallBookDefault)
                              ]),
                        ),
                      ],
                    ),
                    menuContainer: Row(
                      children: [
                        SizedBox(
                          height: 40,
                          child: AlohaSecondaryButton.positive(
                            Text("Action",
                                style: AlohaTheme.of(context)
                                    .textTheme
                                    .bodySmallDefault),
                            onTap: () {},
                            state: AlohaButtonState.inactive,
                            size: AlohaButtonSize.tiny,
                            leftIcon: AlohaIcon(
                              icon: IconName.actions16Add,
                            ),
                            rightIcon: AlohaIcon(
                              icon: IconName.actions16Add,
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(right: 16)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    color: AlohaTheme.of(context).colors.fillBackgroundSecondary,  //can't using navbar background color, class is internal
                    child: SvgPicture.asset(
                        'assets/image2/status_bar.svg'),
                  ),
                  AlohaNavBar(
                    decoration: NavBarDecoration.none,
                    navigationIcon: IconName.navigation24Back,
                    logo: null,
                    titleContainer: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Title",
                                  style: AlohaTheme.of(context)
                                      .textTheme
                                      .titleModerateDemiDefault,
                                )
                              ]),
                        ),
                      ],
                    ),
                    menuContainer: Row(
                      children: [
                        SizedBox(
                          height: 40,
                          child: AlohaSecondaryButton.positive(
                            Text("Action",
                                style: AlohaTheme.of(context)
                                    .textTheme
                                    .bodySmallDefault),
                            onTap: () {},
                            state: AlohaButtonState.inactive,
                            size: AlohaButtonSize.tiny,
                            leftIcon: AlohaIcon(
                              icon: IconName.actions16Add,
                            ),
                            rightIcon: AlohaIcon(
                              icon: IconName.actions16Add,
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(right: 16)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    color: AlohaTheme.of(context).colors.fillBackgroundSecondary,  //can't using navbar background color, class is internal
                    child: SvgPicture.asset(
                        'assets/image2/status_bar.svg'),
                  ),
                  AlohaNavBar(
                    decoration: NavBarDecoration.none,
                    navigationIcon: IconName.navigation24Back,
                    logo: null,
                    titleContainer: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Title",
                                  style: AlohaTheme.of(context)
                                      .textTheme
                                      .titleModerateDemiDefault,
                                )
                              ]),
                        ),
                      ],
                    ),
                    menuContainer: null,
                  ),
                  const SizedBox(height: 24),
                  Container(
                    color: AlohaTheme.of(context).colors.fillBackgroundSecondary,  //can't using navbar background color, class is internal
                    child: SvgPicture.asset(
                        'assets/image2/status_bar.svg'),
                  ),
                  AlohaNavBar(
                    decoration: NavBarDecoration.none,
                    navigationIcon: IconName.navigation24Back,
                    logo: null,
                    titleContainer: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Title",
                                  style: AlohaTheme.of(context)
                                      .textTheme
                                      .titleModerateDemiDefault,
                                ),
                                Text("Subtitle",
                                    style: AlohaTheme.of(context)
                                        .textTheme
                                        .captionSmallBookDefault)
                              ]),
                        ),
                      ],
                    ),
                    menuContainer: null,
                  ),

                  const SizedBox(height: 24),
                  Container(
                    color: AlohaTheme.of(context).colors.fillBackgroundSecondary,  //can't using navbar background color, class is internal
                    child: SvgPicture.asset(
                        'assets/image2/status_bar.svg'),
                  ),
                  AlohaNavBar(
                    decoration: NavBarDecoration.line,
                    navigationIcon: null,
                    logo: null,
                    titleContainer: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Title",
                                  style: AlohaTheme.of(context)
                                      .textTheme
                                      .titleModerateDemiDefault,
                                ),
                              ]),
                        ),
                      ],
                    ),
                    menuContainer: null,
                  ),
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
