import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/business_user.dart';
import '../../utils/constants/colors.dart';
import 'package:tfc_versaofinal/users/business/widgets/home/business_home.dart';
import 'package:tfc_versaofinal/users/business/widgets/profile/business_profile.dart';
import 'package:tfc_versaofinal/utils/helpers/helper_functions.dart';


class BusinessNavigationBarMenu extends StatelessWidget {
  final BusinessUser? user;

  const BusinessNavigationBarMenu({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BusinessNavigationController(user: user));
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
  final Rx<int> selectedIndex = 0.obs;

  late final List<Widget> screens;

  BusinessNavigationController({required BusinessUser? user}) {
    screens = [
      BusinessHomeScreen(user: user!),
      BusinessProfileScreen(user: user),
    ];
  }
}