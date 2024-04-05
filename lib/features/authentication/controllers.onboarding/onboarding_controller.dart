import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tfc_versaofinal/features/authentication/screens/login/private/login.dart';


class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = Rx<int>(0);

  // Update the current context when Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  // Jump to a specific dot selected page.
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  // Upd the current Index and jumps to the next page
  void nextPage() {
    if(currentPageIndex.value == 2) {
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // Upd the current Index and jumps to the last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}