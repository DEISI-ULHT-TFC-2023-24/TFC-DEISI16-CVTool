import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // Variables

  // Update the current context when Scroll
  void updatePageIndicator(index) {}

  // Jump to a specific dot selected page.
  void dotNavigationClick(index) {}

  // Upd the current Index and jumps to the next page
  void nextPage() {}

  // Upd the current Index and jumps to the last page
  void skipPage() {}
}