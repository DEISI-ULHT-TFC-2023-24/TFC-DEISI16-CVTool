import 'package:flutter/material.dart';
import 'package:tfc_versaofinal/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';

class ConditionsCheckbox extends StatelessWidget {
  const ConditionsCheckbox({super.key,});

  @override
  Widget build(BuildContext context) {
    final dark = TFCHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child:
            Checkbox(value: true, onChanged: (value) {})),
        const SizedBox(width: TFCSizes.spaceBtwItems),
        Text.rich(
          TextSpan(children: [
            TextSpan(
                text: TFCTexts.iAgreeTo,
                style: Theme.of(context).textTheme.labelSmall),
            TextSpan(
                text: TFCTexts.privatePolicy,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.apply(
                  color: dark
                      ? TFCColors.white
                      : TFCColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark
                      ? TFCColors.white
                      : TFCColors.primary,
                )),
          ]),
        ),
      ],
    );
  }
}