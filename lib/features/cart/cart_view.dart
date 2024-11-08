import 'package:flutter/material.dart';
import 'package:ninjaa/app_theme/theme_extension.dart';
import 'package:ninjaa/utils/common_library.dart';
import 'package:ninjaa/widgets/addtocart_button.dart';
import 'package:ninjaa/widgets/dashed_line.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
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
          Container(
            decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: BorderRadius.circular(15.sp)),
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
          )
        ],
      ),
    );
  }
}
