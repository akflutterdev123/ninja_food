import 'package:ninjaa/utils/common_library.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.background,
      height: 15.sp,
    );
  }
}
