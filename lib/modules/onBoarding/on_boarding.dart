import 'package:flutter/material.dart';
import 'package:shop_app/modules/login/login_screen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/local/%20cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  String image;
  String title;
  String body;
  BoardingModel({
    @required this.image,
    @required this.title,
    @required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast = false;



  final pageController = PageController();

  List<BoardingModel> boardContent = [
    BoardingModel(
        image: 'assets/images/undraw1.jpg', title: 'Title 1', body: 'Body 1'),
    BoardingModel(
        image: 'assets/images/undraw2.jpg', title: 'Title 2', body: 'Body 2'),
    BoardingModel(
        image: 'assets/images/undraw3.jpg', title: 'Title 3', body: 'Body 3'),
  ];



  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateAndFinish(context, LoginScreen());
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: defaultTextButton(
                function: 
                  submit, 
                
                text: 'SKIP'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) =>
                    buildBoardingItem(boardContent[index]),
                itemCount: boardContent.length,
                physics: BouncingScrollPhysics(),
                controller: pageController,
                onPageChanged: (int index) {
                  if (index == boardContent.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: boardContent.length,
                  effect: SwapEffect(
                      spacing: 8.0,
                      dotWidth: 16.0,
                      dotHeight: 16.0,
                      paintStyle: PaintingStyle.stroke,
                      dotColor: Colors.grey,
                      activeDotColor: defaultColor),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      submit();
                    } else {
                      pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

 
  Widget buildBoardingItem(BoardingModel boardContent) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image(image: AssetImage('${boardContent.image}'))),
          SizedBox(
            height: 30.0,
          ),
          Text(
            '${boardContent.title}',
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            '${boardContent.body}',
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
        ],
      );
}
