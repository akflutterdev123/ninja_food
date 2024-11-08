import 'package:ninjaa/utils/common_library.dart';

extension LocalizedBuildContext on BuildContext {
  AppLocalizations get locale => AppLocalizations.of(this)!;
}
