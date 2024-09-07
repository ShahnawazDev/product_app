import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String cartKey = 'cart';

  static Future<void> saveCart(List<Map<String, dynamic>> cartItems) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(cartKey, jsonEncode(cartItems));
  }

  static Future<List<Map<String, dynamic>>> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = prefs.getString(cartKey);
    if (cartJson != null) {
      return List<Map<String, dynamic>>.from(jsonDecode(cartJson));
    }
    return [];
  }

  static Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(cartKey);
  }
}
