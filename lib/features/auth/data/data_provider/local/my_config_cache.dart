import 'package:flutter/material.dart';
import 'package:food_ox/features/auth/data/data_provider/local/my_config_cache_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyConfigCach {
  static SharedPreferences? preferences;

  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> putString(
      {required MyConfigCacheKeys key, required String value}) async {
    return await preferences?.setString(key.name, value);
  }

  static String getString({
    required MyConfigCacheKeys key,
  }) {
    return preferences?.getString(
          key.name,
        ) ??
        '';
  }

  static void putBoolean(
      {required MyConfigCacheKeys key, required bool value}) async {
    await preferences?.setBool(key.name, value);
  }

  static bool getBoolean({
    required bool defaultValue,
    required MyConfigCacheKeys key,
  }) {
    return preferences?.getBool(
          key.name,
        ) ??
        defaultValue;
  }

  static void putInt({required MyConfigCacheKeys key, required int value}) async {
    await preferences?.setInt(key.name, value);
  }

  static int getInt({
    required MyConfigCacheKeys key,
  }) {
    return preferences?.getInt(
          key.name,
        ) ??
        0;
  }

  static void putDouble(
      {required MyConfigCacheKeys key, required double value}) async {
    await preferences?.setDouble(key.name, value);
  }

  static double getDouble({
    required MyConfigCacheKeys key,
  }) {
    return preferences?.getDouble(
          key.name,
        ) ??
        0.0;
  }

  static Future<void> removeFromShared({
    required MyConfigCacheKeys key,
  }) async {
    await preferences?.remove(key.name);
  }

  static Future<void> clearShared() async {
    await preferences?.clear();
  }

  /// Shared Preferences =>

  static Future<void> cacheLanguageCode(String languageCode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("LOCALE", languageCode);
  }

  static Future<void> cacheThemeCode(String themeCode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("THEME", themeCode);
  }

  static Future<String> getCachedLanguageCode() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cachedLanguageCode = sharedPreferences.getString("LOCALE");
    if (cachedLanguageCode != null) {
      return cachedLanguageCode;
    } else {
      return "ar";
    }
  }

  static Future<String> getCachedThemeCode() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cachedThemeCode = sharedPreferences.getString("THEME");
    if (cachedThemeCode != null) {
      return cachedThemeCode;
    } else {
      return ThemeMode.light.toString();
    }
  }
}
