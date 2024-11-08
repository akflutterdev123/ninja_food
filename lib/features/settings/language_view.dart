import 'package:ninjaa/utils/app_localizations/app_locale.dart';
import 'package:ninjaa/utils/app_localizations/data/language_notifier.dart';
import 'package:ninjaa/utils/common_library.dart';
import 'package:ninjaa/widgets/custom_account_tile.dart';

class LanguageView extends ConsumerStatefulWidget {
  const LanguageView({super.key});

  @override
  ConsumerState<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends ConsumerState<LanguageView> {
  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(languageProvider);
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      appBar: AppBar(
        title: Text(context.locale.hello),
      ),
      body: ListView(
        children: [
          Container(
            color: context.colorScheme.background,
            height: 15.sp,
          ),
          SizedBox(
            height: 20.sp,
          ),
          CustomAccountTile(
              isSelected: locale.languageCode == 'ta',
              icon: Icons.info,
              label: "Tamil",
              onTap: () {
                ref
                    .read(languageProvider.notifier)
                    .changeLocale(const Locale('ta', 'IN'));
              }),
          SizedBox(
            height: 20.sp,
          ),
          CustomAccountTile(
              isSelected: locale.languageCode == 'en',
              icon: Icons.language,
              label: "English",
              onTap: () {
                ref
                    .read(languageProvider.notifier)
                    .changeLocale(const Locale('en', 'IN'));
              }),
        ],
      ),
    );
  }
}
