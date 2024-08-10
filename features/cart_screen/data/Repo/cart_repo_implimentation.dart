import 'dart:math';

import 'package:cibweb/features/cart_screen/data/Repo/cart_repo.dart';

class CartRepoImplimentation implements CartRepo {
  @override
  String generateOrderID(int length) {
    const charset =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    final random = Random.secure();

    return List.generate(
        length, (index) => charset[random.nextInt(charset.length)]).join();
  }
}
