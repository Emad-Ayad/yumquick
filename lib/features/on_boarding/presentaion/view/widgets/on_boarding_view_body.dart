import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnBoardingViewBody> {
  final PageController _controller = PageController();
  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/pizza.png",
      // pizza
      "title": "Order For Food",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.",
    },
    {
      "image": "assets/images/cake.png",
      // delivery
      "title": "Fast Delivery",
      "description":
          "We deliver your food as fast as possible at your doorstep.",
    },
    {
      "image": "assets/images/coffee.png",
      // enjoy food
      "title": "Enjoy Your Meal",
      "description": "Sit back, relax and enjoy delicious meals with ease.",
    },
  ];

  void nextPage() {
    if (currentPage < 2) {
      _controller.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      // Navigate to Home/Login
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              onPageChanged: (index) => setState(() => currentPage = index),
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                final data = onboardingData[index];
                return Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        data["image"]!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.receipt_long,
                              size: 40, color: Colors.orange),
                          SizedBox(height: 10),
                          Text(
                            data["title"]!,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange),
                          ),
                          SizedBox(height: 4),
                          Text(
                            data["description"]!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[700]),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: SmoothPageIndicator(
                              controller: _controller,
                              count: onboardingData.length,
                              effect: WormEffect(
                                dotColor: Colors.orange.shade200,
                                activeDotColor: Colors.orange,
                                dotHeight: 8,
                                dotWidth: 8,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          ElevatedButton(
                            onPressed: nextPage,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              minimumSize: Size(double.infinity, 45),
                            ),
                            child: Text(
                                currentPage == 2 ? "Get Started" : "Next"),
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
            Positioned(
              top: 20,
              right: 20,
              child: currentPage != 2
                  ? GestureDetector(
                      onTap: () => _controller.jumpToPage(2),
                      child: Text("Skip",
                          style: TextStyle(color: Colors.orange, fontSize: 16)),
                    )
                  : SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
