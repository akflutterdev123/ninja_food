 import 'package:ninjaa/utils/common_library.dart';

class NinjaCouponWidget extends StatelessWidget {
  const NinjaCouponWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              decoration: BoxDecoration(color: Colors.deepOrange.shade300,borderRadius: BorderRadius.circular(12.sp)),
              width: 46.w,
              height: 25.h,
              );
  }
}