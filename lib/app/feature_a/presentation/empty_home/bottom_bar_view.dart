import 'dart:math' as math;
import 'package:asphalt_aloha/asphalt_aloha.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:oren/app/core/utils/themes/hex_color.dart';

import 'tabIcon_data.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView(
      {Key? key, this.tabIconsList, this.changeIndex, this.addClick})
      : super(key: key);

  final Function(int index)? changeIndex;
  final Function()? addClick;
  final List<TabIconData>? tabIconsList;

  @override
  _BottomBarViewState createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  AnimationController? actionButtonAnimationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    animationController?.forward();
    actionButtonAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        AnimatedBuilder(
          animation: animationController!,
          builder: (BuildContext context, Widget? child) {
            return Transform(
              transform: Matrix4.translationValues(0.0, 0.0, 0.0),
              child: PhysicalShape(
                color: Colors.white,
                elevation: 16.0,
                clipper: TabClipper(
                    radius: Tween<double>(begin: 0.0, end: 1.0)
                            .animate(CurvedAnimation(
                                parent: animationController!,
                                curve: Curves.fastOutSlowIn))
                            .value *
                        1.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 62,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 4),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: TabIcons(
                                  tabIconData: widget.tabIconsList?[0],
                                  removeAllSelect: () {
                                    setRemoveAllSelection(
                                        widget.tabIconsList?[0]);
                                    widget.changeIndex!(0);
                                  }),
                            ),
                            Expanded(
                              child: TabIcons(
                                  tabIconData: widget.tabIconsList?[1],
                                  removeAllSelect: () {
                                    setRemoveAllSelection(
                                        widget.tabIconsList?[1]);
                                    widget.changeIndex!(1);
                                  }),
                            ),
                            SizedBox(
                              width: Tween<double>(begin: 0.0, end: 1.0)
                                      .animate(CurvedAnimation(
                                          parent: animationController!,
                                          curve: Curves.fastOutSlowIn))
                                      .value *
                                  64.0,
                            ),
                            Expanded(
                              child: TabIcons(
                                  tabIconData: widget.tabIconsList?[2],
                                  removeAllSelect: () {
                                    setRemoveAllSelection(
                                        widget.tabIconsList?[2]);
                                    widget.changeIndex!(2);
                                  }),
                            ),
                            Expanded(
                              child: TabIcons(
                                  tabIconData: widget.tabIconsList?[3],
                                  removeAllSelect: () {
                                    setRemoveAllSelection(
                                        widget.tabIconsList?[3]);
                                    widget.changeIndex!(3);
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom,
                    )
                  ],
                ),
              ),
            );
          },
        ),
        Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
          child: SizedBox(
            width: 38 * 2.0,
            height: 38 + 62.0,
            child: Container(
              alignment: Alignment.topCenter,
              // color: Colors.transparent,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.transparent),
              child: SizedBox(
                width: 38 * 2.0,
                height: 38 * 2.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: AlohaTheme.of(context).colors.fillBackgroundPrimary,
                    shape: BoxShape.circle,
                    boxShadow: <BoxShadow>[
                      AlohaTheme.of(context).shadow.shadowHigh.toBoxShadow()
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ScaleTransition(
                      alignment: Alignment.center,
                      scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController!,
                              curve: Curves.fastOutSlowIn)),
                      child: Container(
                        // alignment: Alignment.center,s
                        decoration: BoxDecoration(
                          color: AlohaTheme.of(context).colors.iconDynamicInactive,
                          gradient: LinearGradient(
                              colors: [
                                AlohaTheme.of(context).colors.fillActiveSecondary,
                                AlohaTheme.of(context).colors.fillActivePrimary,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          shape: BoxShape.circle,
                          boxShadow: <BoxShadow>[
                            AlohaTheme.of(context).shadow.shadowHigh.toBoxShadow()
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                              splashColor: Colors.white.withOpacity(0.1),
                              highlightColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              onTap: widget.addClick,
                              onTapDown: (it) => actionButtonAnimationController
                                ?..reset()
                                ..forward(),
                              onTapCancel: () =>
                                  actionButtonAnimationController?.reverse(),
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Colors.white, BlendMode.srcIn),
                                child: Lottie.asset('assets/image2/qr_kot.json',
                                    repeat: false,
                                    controller: actionButtonAnimationController),
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Text("sssss"),
      ],
    );
  }

  void setRemoveAllSelection(TabIconData? tabIconData) {
    if (!mounted) return;
    setState(() {
      widget.tabIconsList?.forEach((TabIconData tab) {
        tab.isSelected = false;
        if (tabIconData!.index == tab.index) {
          tab.isSelected = true;
        }
      });
    });
  }
}

class TabIcons extends StatefulWidget {
  const TabIcons({Key? key, this.tabIconData, this.removeAllSelect})
      : super(key: key);

  final TabIconData? tabIconData;
  final Function()? removeAllSelect;

  @override
  _TabIconsState createState() => _TabIconsState();
}

class _TabIconsState extends State<TabIcons> with TickerProviderStateMixin {
  @override
  void initState() {
    widget.tabIconData?.animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          if (!mounted) return;
          // widget.tabIconData?.animationController?.reverse();
        }
      });
    widget.tabIconData?.animationController?.forward();
    super.initState();
  }

  void setAnimation() {
    widget.tabIconData?.animationController?.reset();
    widget.tabIconData?.animationController?.forward();
  }

  @override
  Widget build(BuildContext context) {
    AlohaThemeData alohaThemeData = AlohaTheme.of(context);
    return AspectRatio(
      aspectRatio: 1,
      child: Center(
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: () {
            setAnimation();
            if (!widget.tabIconData!.isSelected) {
              widget.removeAllSelect!();
            }
          },
          onTapDown: (details) {
            widget.tabIconData!.animationController!.reverse();
          },
          onTapCancel: () {
            widget.tabIconData!.animationController!.forward();
          },
          child: IgnorePointer(
            child: ScaleTransition(
                alignment: Alignment.center,
                scale: Tween<double>(begin: 0.88, end: 1.0).animate(
                    CurvedAnimation(
                        parent: widget.tabIconData!.animationController!,
                        curve:
                            Interval(0.1, 1.0, curve: Curves.fastOutSlowIn))),
                child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        widget.tabIconData!.isSelected
                            ? alohaThemeData.colors.iconDynamicActive
                            : alohaThemeData.colors.iconDynamicInactive,
                        BlendMode.srcIn),
                    child: Column(children: [
                      Lottie.asset(widget.tabIconData!.imagePath,
                          // repeat: false,
                          controller: widget.tabIconData!.animationController!,
                          width: 43,
                          height: 43),
                      Text(
                        widget.tabIconData!.subTitle,
                        style: GoogleFonts.poppins(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ]))),
          ),
        ),
      ),
    );
  }
}

class TabClipper extends CustomClipper<Path> {
  TabClipper({this.radius = 38.0});

  final double radius;

  @override
  Path getClip(Size size) {
    final Path path = Path();

    final double v = radius * 2;
    path.lineTo(0, 0);
    path.arcTo(Rect.fromLTWH(0, 0, radius, radius), degreeToRadians(180),
        degreeToRadians(90), false);
    path.arcTo(
        Rect.fromLTWH(
            ((size.width / 2) - v / 2) - radius + v * 0.04, 0, radius, radius),
        degreeToRadians(270),
        degreeToRadians(70),
        false);

    path.arcTo(Rect.fromLTWH((size.width / 2) - v / 2, -v / 2, v, v),
        degreeToRadians(160), degreeToRadians(-140), false);

    path.arcTo(
        Rect.fromLTWH((size.width - ((size.width / 2) - v / 2)) - v * 0.04, 0,
            radius, radius),
        degreeToRadians(200),
        degreeToRadians(70),
        false);
    path.arcTo(Rect.fromLTWH(size.width - radius, 0, radius, radius),
        degreeToRadians(270), degreeToRadians(90), false);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(TabClipper oldClipper) => true;

  double degreeToRadians(double degree) {
    final double redian = (math.pi / 180) * degree;
    return redian;
  }
}
