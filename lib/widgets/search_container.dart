import 'package:ninjaa/utils/common_library.dart';

class SearchContainer extends StatelessWidget {
  final String searchContent;
  const SearchContainer({super.key, required this.searchContent});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.sp),
      padding: EdgeInsets.symmetric(horizontal: 15.sp),
      height: 6.h,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(
              color: Theme.of(context).colorScheme.background, width: 3.sp),
          borderRadius: BorderRadius.circular(18.sp)),
      child: Row(children: [
        Icon(
          Icons.search,
          color: Theme.of(context).colorScheme.outline,
        ),
        SizedBox(
          width: 10.sp,
        ),
        Text(
          searchContent,
          style: TextStyle(color: Theme.of(context).colorScheme.outline),
        )
      ]),
    );
  }
}
