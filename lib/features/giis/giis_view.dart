import 'package:ninjaa/features/giis/widgets/saved_vehicle_widget.dart';
import 'package:ninjaa/utils/common_library.dart';
import 'package:ninjaa/widgets/search_container.dart';

class GIISView extends StatefulWidget {
  const GIISView({super.key});

  @override
  State<GIISView> createState() => _GIISViewState();
}

class _GIISViewState extends State<GIISView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.colorScheme.surface,
        appBar: AppBar(
          title: Text('Global India Insurance solutions',
              style: TextStyle(fontSize: 18.sp)),
          centerTitle: false,
        ),
        body: ListView(padding: EdgeInsets.all(15.sp), children: [
          Image.network('https://licindia.in/documents/d/guest/banner11-min'),
          SizedBox(
            height: 20.sp,
          ),
          Text(
            'Enter your Vehicle Number',
            style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 15.sp,
          ),
          const SearchContainer(searchContent: "TN59BW4455"),
          SizedBox(
            height: 20.sp,
          ),
          Container(
            height: 5.h,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12.sp)),
            child: Center(
              child: Text(
                "GO",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17.sp,
                    color: context.colorScheme.onPrimary),
              ),
            ),
          ),
          SizedBox(
            height: 20.sp,
          ),
          const Text('Saved Vehicles'),
          SizedBox(
            height: 15.sp,
          ),
          const SavedVehicleWidget(
              vehicleModel: "TATA ACE GOLD", vehicleNumber: 'TN56AC3453'),
          SizedBox(
            height: 15.sp,
          ),
          const SavedVehicleWidget(
              vehicleModel: "TATA ACE GOLD", vehicleNumber: 'TN56AC3453')
        ]));
  }
}
