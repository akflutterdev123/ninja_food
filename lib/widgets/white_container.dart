import 'package:ninjaa/utils/common_library.dart';

class WhiteContainerWidget extends StatelessWidget {
  final Widget child;
  const WhiteContainerWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(15.sp)),
        child: child);
  }
}
