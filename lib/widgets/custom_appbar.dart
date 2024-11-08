import 'package:ninjaa/utils/common_library.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subTitle;
  final bool showBackButton;
  final List<Widget>? actions;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.showBackButton = true,
    this.actions,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
          preferredSize: preferredSize,
          child: Container(
            height: preferredSize.height,
            width: preferredSize.width,
            color: Theme.of(context).colorScheme.primary,
            padding: EdgeInsets.all(15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close)),
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
              ],
            ),
          )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(8.h);
}
