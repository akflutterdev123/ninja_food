import 'package:ninjaa/utils/common_library.dart';

class AddTocartButton extends StatelessWidget {
  final int cartCount;

  final VoidCallback onTap;
  const AddTocartButton(
      {super.key, required this.onTap, required this.cartCount});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Visibility(
        visible: cartCount == 0,
        replacement: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 7.sp),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.sp),
              border: Border.all(color: context.colorScheme.outline)),
          child: Row(
            children: [
              const Icon(Icons.remove),
              SizedBox(
                width: 10.sp,
              ),
              Text(
                cartCount.toString(),
                style: TextStyle(color: context.colorScheme.primary),
              ),
              SizedBox(
                width: 10.sp,
              ),
              const Icon(Icons.add)
            ],
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
              color: context.colorScheme.primary,
              borderRadius: BorderRadius.circular(12.sp)),
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
          child: Center(
            child: Text(
              'Add to cart',
              style: TextStyle(color: context.colorScheme.surface),
            ),
          ),
        ),
      ),
    );
  }
}
