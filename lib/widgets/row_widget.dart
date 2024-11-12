import 'package:ninjaa/utils/common_library.dart';

class RowWidget extends StatelessWidget {
  final String label;
  final String data;
  final Color? dataColor;
  const RowWidget(
      {super.key, required this.label, required this.data, this.dataColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
            ),
            Text(
              data,
              style: TextStyle(color: dataColor),
            ),
          ],
        ),
        SizedBox(
          height: 15.sp,
        )
      ],
    );
  }
}
