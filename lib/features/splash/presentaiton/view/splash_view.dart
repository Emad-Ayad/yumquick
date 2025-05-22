import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumquick/core/constants/app_text_styles.dart';

import '../../../on_boarding/presentaion/view/on_boarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const routeName = 'splash';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    executeRouting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF5CB58),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  children: [
                    SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.5,
                        width: MediaQuery.sizeOf(context).width * 0.45,
                        child: SvgPicture.asset('assets/images/logo.svg')),
                    Positioned(
                      bottom: 60,
                      child: Row(
                        children: [
                          Text(
                            'YUM',
                            style: AppTextStyles.heading1
                                .copyWith(color: Color(0XFFFF642F)),
                          ),
                          Text(
                            'QUICK',
                            style: AppTextStyles.heading1
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

void executeRouting() {
  Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
  });
}
}
