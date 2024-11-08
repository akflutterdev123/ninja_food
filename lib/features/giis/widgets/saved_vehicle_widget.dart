import 'package:ninjaa/utils/common_library.dart';

class SavedVehicleWidget extends StatelessWidget {
  final String vehicleModel;
  final String vehicleNumber;
  const SavedVehicleWidget(
      {super.key, required this.vehicleModel, required this.vehicleNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.sp),
          color: context.colorScheme.surface,
          border:
              Border.all(width: 3.sp, color: context.colorScheme.background)),
      child: ListTile(
        title: Text(
          vehicleModel,
          style: TextStyle(fontSize: 17.sp),
        ),
        subtitle: Text(vehicleNumber),
      ),
    );
  }
}
