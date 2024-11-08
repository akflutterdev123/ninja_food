import 'package:ninjaa/utils/common_library.dart';

class CommonContainer extends StatelessWidget {
  final Widget child;
  final bool? isBordered;
  const CommonContainer({super.key, required this.child, this.isBordered});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12.sp,
        ),
        color: Theme.of(context).colorScheme.surface,
        border: isBordered ?? false
            ? Border.all(width: 5.sp, color: context.colorScheme.background)
            : null,
      ),
      child: child,
    );
  }
}
