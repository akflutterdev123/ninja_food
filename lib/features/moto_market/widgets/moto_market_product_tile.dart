import 'package:ninjaa/utils/common_library.dart';

class MotoMarketProductTile extends StatelessWidget {
  final int index;
  const MotoMarketProductTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.sp),
      width: 40.w,
      height: 20.h,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(15.sp),
          border: Border.all(
              color: Theme.of(context).colorScheme.background, width: 3.sp)),
      child: Row(
        children: [
          Container(
              height: 20.h,
              width: 100.w,
              color: Theme.of(context).colorScheme.background,
              child: index.isEven
                  ? Image.asset(
                      'assets/images/r15.png',
                      width: 40.w,
                    )
                  : Image.asset(
                      'assets/images/tata_Ace.png',
                      width: 40.w,
                    )),
          SizedBox(
            width: 15.sp,
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 10.sp),
              width: 45.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Yamaha R15 V4 Racing Blue, Intensity White, And Vivid Magenta',
                    style: TextStyle(),
                    maxLines: 3,
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  Text('₹45,700',
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 10.sp,
                  ),
                  Text('2022',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w400))
                ],
              ))
        ],
      ),
    );
  }
}
