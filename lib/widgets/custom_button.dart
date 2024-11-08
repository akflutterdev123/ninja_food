import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ninjaa/utils/common_library.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool? isLoading;
  const CustomButton(
      {super.key, required this.label, required this.onTap, this.isLoading});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 5.5.h,
        decoration: BoxDecoration(
            color: context.colorScheme.primary,
            borderRadius: BorderRadius.circular(12.sp)),
        child: Center(
          child: (isLoading ?? false)
              ? SpinKitThreeBounce(
                  color: context.colorScheme.surface,
                  size: 18.sp,
                )
              : Text(label,
                  style: TextStyle(
                      color: context.colorScheme.onPrimary, fontSize: 17.sp)),
        ),
      ),
    );
  }
}
