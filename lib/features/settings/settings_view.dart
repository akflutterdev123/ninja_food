import 'package:ninjaa/features/authentication/data/authentication_notifier.dart';
import 'package:ninjaa/features/settings/language_view.dart';
import 'package:ninjaa/utils/common_library.dart';
import 'package:ninjaa/widgets/custom_account_tile.dart';

class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({super.key});

  @override
  ConsumerState<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends ConsumerState<SettingsView> {
  Future<void> logOut() async {
    final authNotofier = ref.read(authNotifierProvider.notifier);
    await authNotofier.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      appBar: AppBar(
        title: const Text("Settings"),
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
              icon: Icons.question_answer,
              label: "Check our FAQS",
              onTap: () {}),
          SizedBox(
            height: 20.sp,
          ),
          CustomAccountTile(
              icon: Icons.contact_support, label: "Contact Us", onTap: () {}),
          SizedBox(
            height: 20.sp,
          ),
          CustomAccountTile(icon: Icons.info, label: "About Us", onTap: () {}),
          SizedBox(
            height: 20.sp,
          ),
          CustomAccountTile(
              icon: Icons.color_lens, label: "Theme", onTap: () {}),
          SizedBox(
            height: 20.sp,
          ),
          CustomAccountTile(
              icon: Icons.language,
              label: "Change Language",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LanguageView()));
              }),
          SizedBox(
            height: 20.sp,
          ),
          CustomAccountTile(
              icon: Icons.logout, label: "Log out", onTap: () => logOut()),
        ],
      ),
    );
  }
}
