import 'package:flutter/material.dart';

import '../../features/on_boarding/presentaion/view/on_boarding_view.dart';
import '../../features/splash/presentaiton/view/splash_view.dart';


Route<dynamic> routerGenerator(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());

    // case LoginView.routeName:
    //   return MaterialPageRoute(builder: (context) => const LoginView());
    //
    // case SignUpView.routeName:
    //   return MaterialPageRoute(builder: (context) => const SignUpView());
    //
    // case MainView.routeName:
    //   return MaterialPageRoute(builder: (context) => const MainView());
    //
    // case BestSellingView.routeName:
    //   return MaterialPageRoute(builder: (context) => const BestSellingView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
