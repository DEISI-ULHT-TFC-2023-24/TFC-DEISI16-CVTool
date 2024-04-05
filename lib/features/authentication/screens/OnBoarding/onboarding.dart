import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfc_versaofinal/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:tfc_versaofinal/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:tfc_versaofinal/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:tfc_versaofinal/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:tfc_versaofinal/features/authentication/screens/onboarding/widgets/onboarding_pages.dart';
import 'package:tfc_versaofinal/utils/constants/image_strings.dart';
import 'package:tfc_versaofinal/utils/constants/text_strings.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          // Horizontal Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TFCImages.onBoardingImage1,
                title: TFCTexts.onBoardingTittle1,
                subTitle: TFCTexts.onBoardingSubTittle1,
              ),
              OnBoardingPage(
                image: TFCImages.onBoardingImage2,
                title: TFCTexts.onBoardingTittle2,
                subTitle: TFCTexts.onBoardingSubTittle2,
              ),
              OnBoardingPage(
                image: TFCImages.onBoardingImage3,
                title: TFCTexts.onBoardingTittle3,
                subTitle: TFCTexts.onBoardingSubTittle3,
              ),
            ],
          ),
          // Skip Button
          const OnBoardingSkip(),

          // Dot Navigation SmoothPage
          const OnBoardingDotNavigation(),
          
          // Circular Button
          const OnBordingNextButton(),
        ],
      ),
    );
  }
}




