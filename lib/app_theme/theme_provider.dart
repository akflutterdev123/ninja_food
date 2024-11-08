import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeStateProvider = StateNotifierProvider<ThemeStateNotifier, bool>(
    (ref) => ThemeStateNotifier());

class ThemeStateNotifier extends StateNotifier<bool> {
  ThemeStateNotifier() : super(false);

  void setThemedata(bool isDark) {
    state = isDark;
  }
}
