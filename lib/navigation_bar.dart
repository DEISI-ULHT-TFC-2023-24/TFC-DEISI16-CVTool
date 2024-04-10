import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationBarMenu extends StatelessWidget {
  const NavigationBarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    // This method allows to only redraw the navigation bar, increasing performance
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
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
class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs; // Its a variable that is observed by the widget

  final screens = [Container(color: Colors.green), Container(color: Colors.blue), Container(color: Colors.purple), Container(color: Colors.yellow)];
}