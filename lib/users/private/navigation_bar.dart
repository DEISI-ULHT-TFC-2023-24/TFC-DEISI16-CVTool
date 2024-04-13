import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfc_versaofinal/users/private/widgets/home/private_home.dart';
import 'package:tfc_versaofinal/users/private/widgets/mail/private_mail.dart';
import 'package:tfc_versaofinal/users/private/widgets/offers/private_offers.dart';
import 'package:tfc_versaofinal/users/private/widgets/profile/private_profile.dart';
import 'package:tfc_versaofinal/utils/helpers/helper_functions.dart';
import '../../utils/constants/colors.dart';
import 'models/private_user_model.dart';

class NavigationBarMenu extends StatelessWidget {
  final PrivateUser? user;

  const NavigationBarMenu({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController(user: user));
    final dark = TFCHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: dark
              ? TFCColors.white.withOpacity(0.1)
              : TFCColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Menu'),
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
class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  late final List<Widget> screens;

  NavigationController({required PrivateUser? user}) {
    screens = [
      PrivateHomeScreen(user: user!),
      const PrivateOffersScreen(),
      const PrivateMailScreen(),
      PrivateProfileScreen(user: user),
    ];
  }
}
