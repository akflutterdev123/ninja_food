import 'package:ninjaa/utils/common_library.dart';

final languageProvider =
    NotifierProvider<LanguageNotifier, Locale>(LanguageNotifier.new);

class LanguageNotifier extends Notifier<Locale> {
  LanguageNotifier() : super();

  @override
  Locale build() {
    return const Locale('ta', 'IN');
  }

  void changeLocale(Locale locale) {
    state = locale;
  }
}
