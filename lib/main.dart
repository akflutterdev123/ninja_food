import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ninjaa/features/push_notifications/push_notifications_helper.dart';
import 'package:ninjaa/firebase_options.dart';
import 'package:ninjaa/utils/app_localizations/data/language_notifier.dart';
import 'package:ninjaa/utils/common_library.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  PushNotificationHelper().setupFlutterNotifications();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeStateProvider);
    final locale = ref.watch(languageProvider);
    final router = ref.watch(goRouterProvider);
    return ResponsiveSizer(
      builder: (p0, p1, p2) {
        return MaterialApp.router(
          locale: locale,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            AppLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          title: 'Ninjamart',
          theme: AppTheme().getAppThemeData(context, isDark),
        );
      },
    );
  }
}
