import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tfc_versaofinal/utils/constants/colors.dart';
import 'package:tfc_versaofinal/utils/constants/sizes.dart';
import 'package:tfc_versaofinal/utils/device/device_utility.dart';
import 'package:tfc_versaofinal/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class OnBordingNextButton extends StatelessWidget {
  const OnBordingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = TFCHelperFunctions.isDarkMode(context);
    return Positioned(
      right: TFCSizes.defaultSpace,
      bottom: TFCDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: (){},
        style: ElevatedButton.styleFrom(shape: const CircleBorder(), backgroundColor: dark ? TFCColors.primary: Colors.black),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}