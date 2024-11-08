import 'package:ninjaa/utils/common_library.dart';

class CustomAccountTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool? isSelected;
  const CustomAccountTile(
      {super.key,
      this.isSelected,
      required this.icon,
      required this.label,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      size: 20.sp,
                    ),
                    SizedBox(
                      width: 15.sp,
                    ),
                    Text(
                      label,
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 17.sp),
                    ),
                  ],
                ),
                if (isSelected ?? false)
                  Row(
                    children: [
                      Icon(
                        Icons.verified,
                        size: 20.sp,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                    ],
                  ),
              ],
            ),
            SizedBox(
              height: 10.sp,
            ),
            Divider(
              thickness: 2.5.sp,
            )
          ],
        ),
      ),
    );
  }
}
