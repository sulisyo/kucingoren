import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get_it/get_it.dart';

import '../../../l10n/app_localizations.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WelcomeScreenState();
  }
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final stringR = GetIt.I<AppLocalizations>();

  final List<String> lottieJson = [
    'assets/animations/cat_is_laughing.json',
    'assets/animations/cat_is_sleeping_and_rolling.json',
    'assets/animations/happy_cat.json',
    'assets/animations/running_cat.json',
  ];

  List<String> get subtitles => [
        stringR.orenCatLaughing,
        stringR.orenCatSleeping,
        stringR.orenCatEating,
        stringR.orenCatRunning
      ];
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(title: Text('Welcome kuching oren')),
        body: Container(
          color: Colors.white,
          child: Stack(children: [
            Expanded(
              child: CarouselSlider(
                items: _imageSliders(lottieJson, subtitles, width),
                carouselController: _controller,
                options: CarouselOptions(
                    autoPlay: false,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: false,
                    viewportFraction: 1.0,
                    height: height,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
            ),
            Positioned(
                bottom: 80.0,
                left: 0.0,
                right: 0.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: lottieJson.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : Colors.orange)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList()
                    ..add(GestureDetector(
                      onTap: () => _controller.animateToPage(4),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : Colors.orange)
                                    .withOpacity(_current == 4 ? 0.9 : 0.4)),
                      ),
                    )),
                )),
          ]),
        ));
  }
}

List<Widget> _imageSliders(
        List<String> lottieJson, List<String> subs, double width) =>
    lottieJson
        .map<Widget>((item) => Container(
              child: Container(
                margin: EdgeInsets.all(0.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(0.0)),
                    child: Stack(
                      children: <Widget>[
                        // Image.network(item, fit: BoxFit.cover, width: 1000.0),
                        Container(
                          width: width,
                          margin: EdgeInsets.only(bottom: 110),
                          child: Lottie.asset(item, fit: BoxFit.fitWidth),
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(240, 200, 100, 0),
                                  Color.fromARGB(0, 200, 100, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 20.0),
                            child: Text(
                              '${subs[lottieJson.indexOf(item)]} ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList()
      ..add(_loginWidget());

Widget _loginWidget() {
  return Scaffold(
    body: Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.t,
        children: [
          // Tambahkan Spacer di sini
          // const Spacer(),
          Container(
            height: 350,
            child: Lottie.asset('assets/animations/rocket_cat.json',
                fit: BoxFit.fitWidth),
          ),
          // gunakan Spacer
          //const Spacer(),
          // Tambah tombol Login dan Register
          ElevatedButton(
            onPressed: () {},
            child: const Text('Login'),
            style: ElevatedButton.styleFrom(
              primary: const Color(0xffee8301),
              minimumSize: const Size(240.0, 40.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              // textStyle: GoogleFonts.poppins(fontSize: 14.0),
            ),
          ),
          const SizedBox(height: 10.0),
          // Tombol Register
          ElevatedButton(
            onPressed: () {},
            child: const Text('Register'),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: const Color(0xffee8301),
              minimumSize: const Size(240.0, 40.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              // textStyle: GoogleFonts.poppins(fontSize: 14.0),
              side: const BorderSide(color: Color(0xffEE8301)),
            ),
          ),
          const Spacer(),
        ],
      ),
    ),
  );
}
