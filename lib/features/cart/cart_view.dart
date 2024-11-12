import 'package:flutter/material.dart';
import 'package:ninjaa/app_theme/theme_extension.dart';
import 'package:ninjaa/utils/common_library.dart';
import 'package:ninjaa/widgets/addtocart_button.dart';
import 'package:ninjaa/widgets/dashed_line.dart';
import 'package:ninjaa/widgets/row_widget.dart';
import 'package:ninjaa/widgets/white_container.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  List ninjaPoints = [
    "1.Near Guru theatre (625016)",
    "2. Near Big Bazzar (625016)",
    "3. Near KFC (625016)",
    "4.Near Unlimited Show Room (625016)",
    "5.Near Fatima College (625016)",
  ];
  String selectedNinjaPoint = '5.Near Fatima College (625016)';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      appBar: AppBar(
        title: const Text('Ninja Foods'),
      ),
      body: ListView(
        padding: EdgeInsets.all(15.sp),
        children: [
          WhiteContainerWidget(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Ninja Spc chicken briyani'),
                          Row(
                            children: [
                              AddTocartButton(onTap: () {}, cartCount: 1),
                              SizedBox(
                                width: 15.sp,
                              ),
                              Text(
                                '₹ 149',
                                style: TextStyle(fontSize: 15.sp),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                MySeparator(
                  color: context.colorScheme.outline,
                ),
                Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Add more items'), Icon(Icons.add_circle)],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15.sp,
          ),
          Text(
            "Bill details",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
          ),
          SizedBox(
            height: 15.sp,
          ),
          WhiteContainerWidget(
              child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              children: [
                const RowWidget(label: "Item Price", data: "₹99"),
                const RowWidget(label: "Delivery Fee", data: "FREE"),
                const RowWidget(
                  label: "Ninja Coins (10 Coins)",
                  data: "- ₹10",
                  dataColor: Colors.green,
                ),
                MySeparator(
                  color: context.colorScheme.outline,
                ),
                SizedBox(
                  height: 15.sp,
                ),
                const RowWidget(label: "To Pay", data: "₹89"),
              ],
            ),
          )),
          SizedBox(
            height: 15.sp,
          ),
          Text(
            "Select Ninja delivery Point to prefer fast & secure delivery",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
          ),
          SizedBox(
            height: 15.sp,
          ),
          WhiteContainerWidget(
              child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none)),
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            isExpanded: true,
            items: ninjaPoints
                .map((e) => DropdownMenuItem<String>(
                      value: e,
                      child: Text(
                        e,
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.w400),
                      ),
                    ))
                .toList(),
            value: selectedNinjaPoint,
            onChanged: (val) {
              setState(() {
                selectedNinjaPoint = val ?? "";
              });
            },
          )),
          SizedBox(
            height: 20.sp,
          ),
          CustomButton(label: 'Pay', onTap: () => context.goNamed(orderDetails))
        ],
      ),
    );
  }
}
