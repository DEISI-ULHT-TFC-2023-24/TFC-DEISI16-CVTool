import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tfc_versaofinal/users/private/widgets/mail/private_mail.dart';
import 'package:tfc_versaofinal/users/private/widgets/offers/private_offers.dart';
import 'package:tfc_versaofinal/utils/constants/colors.dart';
import 'package:tfc_versaofinal/utils/helpers/helper_functions.dart';

class BusinessNavigationBarMenu extends StatelessWidget {
  const BusinessNavigationBarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BusinessNavigationController());
    final dark = TFCHelperFunctions.isDarkMode(context);

    // This method allows to only redraw the navigation bar, increasing performance
    return Scaffold(
      bottomNavigationBar: Obx(
            () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: dark ? TFCColors.white.withOpacity(0.1) : TFCColors.black.withOpacity(0.1),

          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home1), label: 'Menu'),
            NavigationDestination(icon: Icon(Icons.search), label: 'Ofertas'),
            NavigationDestination(icon: Icon(Icons.mail), label: 'Correio'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Perfil'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

// Class that is responsible by the Navigation Bar index
class BusinessNavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs; // Its a variable that is observed by the widget

  final screens = [const PrivateOffersScreen(), const PrivateOffersScreen(), const PrivateMailScreen(), const PrivateMailScreen()];
}