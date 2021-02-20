import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nhl_reward/signin.dart';

import 'data/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Berlin',
            ),
        appBarTheme: AppBarTheme(
            textTheme: TextTheme(headline6: TextStyle(fontFamily: 'Berlin'))),
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SliderModel> slides = new List<SliderModel>();

  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
          color: isCurrentPage ? Colors.grey : Colors.blueGrey,
          borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides = getSlides();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: pageController,
          itemCount: slides.length,
          onPageChanged: (val) {
            setState(() {
              currentIndex = val;
            });
          },
          itemBuilder: (context, index) {
            return SliderTile(
              imageAssetPath: slides[index].getImageAssetPath(),
              title: slides[index].getTitle(),
              description: slides[index].getDescription(),
            );
          }),
      bottomSheet: currentIndex != slides.length - 1
          ? Container(
              height: Platform.isIOS ? 60 : 70,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      pageController.animateToPage(slides.length - 1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear);
                    },
                    child: Text("SKIP"),
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < slides.length; i++)
                        currentIndex == i
                            ? pageIndexIndicator(true)
                            : pageIndexIndicator(false),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      pageController.animateToPage(currentIndex + 1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear);
                    },
                    child: Text("NEXT"),
                  ),
                ],
              ),
            )
          : Container(
              alignment: Alignment.center,
              height: Platform.isIOS ? 70 : 60,
              width: MediaQuery.of(context).size.width,
              color: Colors.blueGrey,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                },
                child: Text(
                  " SIGN UP TO CLAIM",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Berlin',
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
    );
  }
// );
}

class SliderTile extends StatelessWidget {
  String imageAssetPath, title, description;

  SliderTile({this.imageAssetPath, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageAssetPath),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
