import 'package:flutter/material.dart';
import 'package:tfc_versaofinal/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:tfc_versaofinal/utils/constants/sizes.dart';
import 'package:tfc_versaofinal/utils/device/device_utility.dart';


class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TFCDeviceUtils.getAppbarHeight(),
        right: TFCSizes.defaultSpace,
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(), child:  const Text('Saltar')),
    );
  }
}