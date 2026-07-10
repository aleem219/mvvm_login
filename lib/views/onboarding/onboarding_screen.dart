import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:mvvm_login/res/routes/routes_name.dart';
import 'package:mvvm_login/view_models/user_prefrence/user_prefrence.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Widget> _pages = [
    OnboardingComponents(
         title: "Welcome",
        description: "Discover the app that makes your life easier.",
        imagePath: 'assets/img_1.png',
    ),
    OnboardingComponents(
      title: "Explore",
      description: "Explore amazing features tailored for you.",
      imagePath: 'assets/img_2.png',
    ),
    OnboardingComponents(
      title: "Stay Connected",
      description: "Keep in touch with your friends and family.",
      imagePath: 'assets/img_3.png',
    ),
    OnboardingComponents(
      title: "Get Started",
      description: "Lets dive into the app directly.",
      imagePath: 'assets/img_4.png',
    )
  ];

  void _skip() {
    _pageController.animateToPage(
        _pages.length - 1,
        duration: Duration(microseconds: 500),
        curve: Curves.easeInOut);
  }

  void _onNext() {
    if (_currentIndex < _pages.length - 1) {
      _pageController.nextPage(
          duration: Duration(microseconds: 500),
          curve: Curves.easeInOut);
    } else {
      _onFinish();
    }
  }

  Future<void> _onFinish() async {
    await UserPreference().setOnboardingComplete();
    Get.offAllNamed(RouteName.loginScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
              onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
              },
              itemBuilder: (context, index) => _pages[index],
          ),
          _currentIndex == _pages.length - 1 ? SizedBox.shrink() : Positioned(
            bottom: 40,
              left: 20,
              child: TextButton(
                  onPressed: () {
                    _skip();
                  },
                  child: Text(
                    'Skip',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w700
                  ),)
              )
          ),
          Positioned(
              bottom: 40,
              right: 20,
              child: TextButton(
                  onPressed: () {
                    _onNext();
                  },
                  child: Text(
                    _currentIndex == _pages.length - 1 ? "Finish" : "Next",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w700
                    ),)
              )
          ),
          
          Positioned(
            left: 0,
              right: 0,
              bottom: 40,
              child: Center(
                child: SmoothPageIndicator(
                    controller: _pageController,
                    count: _pages.length,
                  effect: WormEffect(
                    dotHeight: 12,
                    dotWidth: 12,
                    dotColor: Colors.grey,
                    activeDotColor: Colors.blue
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}


class OnboardingComponents extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  const OnboardingComponents({super.key, required this.title, required this.description, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
            imagePath,
            height: screenHeight * 0.5
        ),
        SizedBox(height: 30,),
        Text(
            title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20,),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(  fontSize: 16,color: Colors.grey[700]),
          ),
        )
      ],
    );
  }
}
