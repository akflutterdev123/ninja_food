import 'package:flutter/material.dart';
import 'package:ninjaa/features/settings/settings_view.dart';
import 'package:ninjaa/utils/common_library.dart';
import 'package:ninjaa/widgets/common_container.dart';
import 'package:ninjaa/widgets/coupon_widget.dart';
import 'package:ninjaa/widgets/custom_account_tile.dart';

class NinjaAccountView extends StatefulWidget {
  const NinjaAccountView({super.key});

  @override
  State<NinjaAccountView> createState() => _NinjaAccountViewState();
}

class _NinjaAccountViewState extends State<NinjaAccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Ninja Account'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SettingsView()));
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.sp),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 15.sp,
            ),
            CommonContainer(
                isBordered: true,
                child: SizedBox(
                  height: 20.h,
                )),
            SizedBox(
              height: 15.sp,
            ),
            Container(
              padding: EdgeInsets.all(15.sp),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 5.sp, color: context.colorScheme.background),
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(15.sp)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Available Ninja Coins :       200'),
                  TextButton(
                      onPressed: () {}, child: const Text("More history"))
                ],
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            Text(
              "Ninja Rewards",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17.sp),
            ),
            SizedBox(
              height: 20.sp,
            ),
            Wrap(
              spacing: 10.sp,
              runSpacing: 10.sp,
              children: const [
                NinjaCouponWidget(),
                NinjaCouponWidget(),
                NinjaCouponWidget(),
                NinjaCouponWidget(),
                NinjaCouponWidget(),
                NinjaCouponWidget(),
                NinjaCouponWidget(),
                NinjaCouponWidget(),
              ],
            ),
            SizedBox(
              height: 60.sp,
            ),
          ],
        ),
      ),
    );
  }
}
