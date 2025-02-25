import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../widgets/page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  
  List<Map<String, String>> onboardingData = [
    {
      'title': 'Smart Shopping Made Easy',
      'description': 'Organize, find, and enjoy your shopping experience in a more modern and dynamic way',
      'icon': 'assets/icons/cart.png',
    },
    {
      'title': 'Track Your Savings',
      'description': 'Keep track of all your discounts and savings across different stores in one place',
      'icon': 'assets/icons/savings.png',
    },
    {
      'title': 'Personalized Recommendations',
      'description': 'Get tailored deals and offers based on your shopping preferences',
      'icon': 'assets/icons/recommendations.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.teaGreen,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'SavvyCart',
                        style: TextStyle(
                          color: AppColors.lightText,
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.darkSpringGreen,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: (int page) {
                            setState(() {
                              _currentPage = page;
                            });
                          },
                          itemCount: onboardingData.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(40.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: AppColors.teaGreen,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Icon(
                                      Icons.shopping_cart,
                                      size: 50.0,
                                      color: AppColors.darkSpringGreen,
                                    ),
                                  ),
                                  SizedBox(height: 40.0),
                                  Text(
                                    onboardingData[index]['title']!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryText,
                                    ),
                                  ),
                                  SizedBox(height: 20.0),
                                  Text(
                                    onboardingData[index]['description']!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: AppColors.secondaryText,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 30.0),
                        child: Column(
                          children: [
                            PageIndicator(
                              count: onboardingData.length,
                              currentIndex: _currentPage,
                              activeColor: AppColors.darkSpringGreen,
                              inactiveColor: AppColors.celadon,
                            ),
                            SizedBox(height: 40.0),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40.0),
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/signup');
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      child: Text(
                                        'SIGN UP',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15.0),
                                  OutlinedButton(
                                    onPressed: () {},
                                    child: Container(
                                      width: double.infinity,
                                      child: Text(
                                        'LOGIN',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
