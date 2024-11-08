import 'package:ninjaa/features/moto_market/widgets/moto_market_product_tile.dart';
import 'package:ninjaa/utils/common_library.dart';

class MotomarketView extends StatefulWidget {
  const MotomarketView({super.key});

  @override
  State<MotomarketView> createState() => _MotomarketViewState();
}

class _MotomarketViewState extends State<MotomarketView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('MOTO MARKET', style: TextStyle(fontSize: 18.sp)),
        automaticallyImplyLeading: false,
        centerTitle: false,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.sp),
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            height: 6.h,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                border: Border.all(
                    color: Theme.of(context).colorScheme.background,
                    width: 3.sp),
                borderRadius: BorderRadius.circular(20.sp)),
            child: Row(children: [
              Icon(
                Icons.search,
                color: Theme.of(context).colorScheme.outline,
              ),
              SizedBox(
                width: 10.sp,
              ),
              Text(
                'Search your dream bike here',
                style: TextStyle(color: Theme.of(context).colorScheme.outline),
              )
            ]),
          ),
          SizedBox(
            height: 15.sp,
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 12,
              itemBuilder: (_, i) {
                return MotoMarketProductTile(index: i);
              })
        ],
      ),
    );
  }
}
