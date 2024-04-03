import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tfc_versaofinal/utils/constants/colors.dart';
import 'package:tfc_versaofinal/utils/constants/sizes.dart';
import 'package:tfc_versaofinal/utils/device/device_utility.dart';
import 'package:tfc_versaofinal/utils/helpers/helper_functions.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = TFCHelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: TFCDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: TFCSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: PageController(),
        count: 3,
        effect: ExpandingDotsEffect(
            activeDotColor: dark ? TFCColors.light: TFCColors.dark, dotHeight: 6),
      ),
    );
  }
}