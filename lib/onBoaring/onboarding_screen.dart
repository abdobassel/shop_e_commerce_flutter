import 'package:flutter/material.dart';
import 'package:shop_app/login/login.dart';
import 'package:shop_app/models/boardingModel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoardingScreen extends StatefulWidget {
  onBoardingScreen({super.key});

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  List<OnBoardingModel> onboardinglist = [
    OnBoardingModel(
        image: 'assets/images/done.png', title: 'Title 1', body: 'body 1'),
    OnBoardingModel(
        image: 'assets/images/friendship.png',
        title: 'Title 2',
        body: 'body 2'),
    OnBoardingModel(
        image: 'assets/images/delivery.png', title: 'Title 3', body: 'body 3'),
  ];

  var pageController = PageController();
  bool isLastPage =
      false; // will changing to true to controll my pageviwe while come last pages

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) {
                return Login();
              }), (route) => false);
            },
            child: Text('Skip'))
      ]),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    ItemOnBoarding(onboardinglist[index]),
                itemCount: onboardinglist.length,
                controller: pageController,
                onPageChanged: (index) {
                  if (index == onboardinglist.length - 1) {
                    setState(() {
                      isLastPage = true;
                    });
                  } else {
                    setState(() {
                      isLastPage = false;
                    });
                  }
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SmoothPageIndicator(
                    controller: pageController,
                    count: onboardinglist.length,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      dotHeight: 10,
                      dotWidth: 10,
                      expansionFactor: 4,
                      spacing: 5,
                    )),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLastPage) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ),
                          (route) => false);
                    } else {
                      pageController.nextPage(
                          duration: Duration(milliseconds: 600),
                          curve: Curves.easeIn);
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget ItemOnBoarding(OnBoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Image(
            image: AssetImage('${model.image}'),
          )),
          SizedBox(
            height: 30,
          ),
          Text(
            '${model.title}',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 15,
          ),
          Text('${model.body}', style: TextStyle(fontSize: 14)),
          SizedBox(
            height: 20,
          )
        ],
      );
}
