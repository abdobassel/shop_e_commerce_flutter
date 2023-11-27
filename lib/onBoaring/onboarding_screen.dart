import 'package:flutter/material.dart';
import 'package:shop_app/models/boardingModel.dart';

class onBoardingScreen extends StatelessWidget {
  onBoardingScreen({super.key});

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(actions: [TextButton(onPressed: () {}, child: Text('Skip'))]),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) =>
                    ItemOnBoarding(onboardinglist[index]),
                itemCount: onboardinglist.length,
                controller: pageController,
                onPageChanged: (value) {},
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('data ddd'),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {},
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
          Expanded(child: Image(image: AssetImage('${model.image}'))),
          SizedBox(
            height: 25,
          ),
          Text(
            '${model.title}',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 15,
          ),
          Text('${model.body}', style: TextStyle(fontSize: 14)),
        ],
      );
}
