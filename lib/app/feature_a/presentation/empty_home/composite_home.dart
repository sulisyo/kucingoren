import 'package:asphalt_aloha/asphalt_aloha.dart';
import 'package:flutter/material.dart';
import 'package:oren/app/feature_a/presentation/empty_home/profile_screen.dart';
import 'package:oren/app/feature_a/presentation/empty_home/title_view.dart';
import 'package:sliver_tools/sliver_tools.dart';


class CompositeHome extends StatefulWidget {
  const CompositeHome({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CompositeHomeState();
  }
}

class _CompositeHomeState extends State<CompositeHome>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  CategoryType categoryType = CategoryType.ui;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const int count = 9;
    animationController?.forward();
    Widget nganu = CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 250.0,
          title: getAppBarUI(),
          flexibleSpace: FlexibleSpaceBar(
            title: Text("dfdf"),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(10),

          // optional, defaults to the Directionality specified by the context
          sliver: SliverStack(children: [
            SliverPositioned.fill(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 8,
                      color: Colors.black26,
                    )
                  ],
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SliverPadding(
                padding: EdgeInsets.all(20),
                // optional, defaults to the Directionality specified by the context
                sliver: MultiSliver(children: [
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.0,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return gridItem(index);
                      },
                      childCount: 8,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: getButtonUI(CategoryType.basic, false),
                    ),
                  )
                ])),
          ]),
        ),
        SliverToBoxAdapter(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: TitleView(
                titleTxt: ''
                    'lorem ipsum',
                subTxt: 'Customize',
                animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                        parent: animationController!,
                        curve: Interval((1 / count) * 2, 1.0,
                            curve: Curves.fastOutSlowIn))),
                animationController: animationController!,
              ),
            ),
          ),
        ),
        SliverCrossAxisPadded(
          paddingStart: 10,
          paddingEnd: 10,
          textDirection: TextDirection.ltr,
          // optional, defaults to the Directionality specified by the context
          child: SliverStack(children: [
            SliverPositioned.fill(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 8,
                      color: Colors.black26,
                    )
                  ],
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SliverPadding(
                padding: EdgeInsets.all(20),
                // optional, defaults to the Directionality specified by the context
                sliver: MultiSliver(children: [
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.0,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return gridItem(index);
                      },
                      childCount: 4,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        "Title",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: 0.27,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          letterSpacing: 0.27,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: getButtonUI(CategoryType.basic, false)),
                  ),
                ])),
          ]),
        ),
        // SliverCrossAxisPadded(
        //   paddingStart: 10,
        //   paddingEnd: 10,
        //   textDirection: TextDirection.ltr,
        //   // optional, defaults to the Directionality specified by the context
        //   child:
        SliverPadding(
          padding: const EdgeInsets.all(10),
          sliver: SliverToBoxAdapter(
            child: shrinkAnimated(
              child: Container(
                alignment: Alignment.topLeft,
                // height: 200,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 8,
                      color: Colors.black26,
                    )
                  ],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 200,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 8,
                            color: Colors.black26,
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        "Title",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: 0.27,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          letterSpacing: 0.27,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // SliverPadding(
        //     padding: EdgeInsets.all(20),
        //     // optional, defaults to the Directionality specified by the context
        //     sliver: MultiSliver(children: [
        //
        //
        //       SliverToBoxAdapter(
        //         child: Padding(
        //           padding: const EdgeInsets.only(top: 20.0),
        //            child: getButtonUI(CategoryType.basic, false),
        //         ),
        //       )
        //     ])),
        // ]),
        // ),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.lightBlue[100 * (index % 9)],
              child: Text('List Item $index'),
            );
          }, childCount: 16),
        ),
      ],
    );

    return Scaffold(body: nganu);
  }

  Widget getButtonUI(CategoryType categoryTypeData, bool isSelected) {
    AnimationController animationController = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
    String txt = '';
    if (CategoryType.ui == categoryTypeData) {
      txt = 'Ui/Ux';
    } else if (CategoryType.coding == categoryTypeData) {
      txt = 'Coding';
    } else if (CategoryType.basic == categoryTypeData) {
      txt = 'Basic UI';
    }
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            boxShadow: getBoxShadow(),
            color: isSelected ? Colors.blue : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            border: Border.all(color: Colors.blue)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            onTap: () {
              setState(() {
                categoryType = categoryTypeData;
              });
            },
            child: shrinkAnimated(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(children: [
                  Image.asset(
                    'assets/image2/tab_1.png',
                    width: 30,
                    height: 30,
                  ),
                  Expanded(
                    child: Text(
                      txt,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        letterSpacing: 0.27,
                        color: isSelected ? Colors.white : Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 26,
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  final double topBarOpacity = 0.8;

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(32.0),
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16, // - 8.0 * topBarOpacity,
                    bottom: 12), // - 8.0 * topBarOpacity),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        // child: Text(
                        //   'My Diary',
                        //   textAlign: TextAlign.left,
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.w700,
                        //     fontSize: 22 + 6 - 6 * topBarOpacity,
                        //     letterSpacing: 1.2,
                        //     color: Colors.black,
                        //   ),
                        // ),
                      ),
                    ),
                    SizedBox(
                      height: 38,
                      width: 38,
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(32.0)),
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(1.0),
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10.0,
                                offset: Offset(0, 4),
                              ),
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                            color: Color(0xffee8301),
                          ),
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => ProfileScreen())),
                            child: Hero(
                              tag: 'avatar',
                              child: const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/image2/profile_pic.png'),
                                radius: 10.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget gridItem(int index) {
    return shrinkAnimated(
      child: Container(
        alignment: Alignment.center,
        // color: Colors.teal[100 * (index % 9)],
        child: Text('Item $index'),
        decoration: AlohaBoxDecoration(
          color: Colors.teal[400],
          boxShadow: getBoxShadow(),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  List<BoxShadow> getBoxShadow() => const <BoxShadow>[
        BoxShadow(
          offset: Offset(0, 4),
          blurRadius: 8,
          color: Colors.black26,
        )
      ];

  Widget shrinkAnimated({required Widget child}) {
    AnimationController animationController = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
    return GestureDetector(
      onTapDown: (details) => animationController
        ..reset()
        ..forward(),
      onTapUp: (details) => animationController.reverse(),
      onTapCancel: () => animationController.reverse(),
      onTap: () => animationController
        ..forward(from: 1.0)
        ..reverse(),
      child: ScaleTransition(
        alignment: Alignment.center,
        scale: Tween<double>(begin: 1.0, end: 0.96).animate(CurvedAnimation(
            parent: animationController!, curve: Curves.fastOutSlowIn)),
        child: child,
      ),
    );
  }
}

enum CategoryType {
  ui,
  coding,
  basic,
}
