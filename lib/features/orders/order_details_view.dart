import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ninjaa/utils/common_library.dart';
import 'package:ninjaa/widgets/row_widget.dart';

class OrderDetailsView extends StatefulWidget {
  const OrderDetailsView({super.key});

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.colorScheme.background,
        body: Container(
          width: 100.w,
          padding: EdgeInsets.all(15.sp),
          child: ListView(
            children: [
              SizedBox(
                height: 5.h,
              ),
              const Align(
                  alignment: Alignment.center, child: Text('Your order')),
              SizedBox(
                height: 15.sp,
              ),
              Card(
                child: Container(
                  width: 100.w,
                  padding: EdgeInsets.all(15.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.network(
                            'https://www.shutterstock.com/image-photo/chicken-biryani-quick-tasty-dum-600nw-2468105649.jpg',
                            width: 20.w,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ninja Mini Box (Non-Veg)',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17.sp),
                              ),
                              SizedBox(
                                height: 10.sp,
                              ),
                              Text(
                                '2 Items - ₹198.00',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp),
                              ),
                              SizedBox(
                                height: 10.sp,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Container(
                        width: 100.w,
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.sp, vertical: 10.sp),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.sp),
                            color: context.colorScheme.background),
                        child: Center(
                          child: Text(
                            'Tap for support,details & more actions',
                            style: TextStyle(fontSize: 15.sp),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Row(
                        children: [
                          Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/QR_code_for_mobile_English_Wikipedia.svg/800px-QR_code_for_mobile_English_Wikipedia.svg.png',
                            width: 25.w,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Out for delivery',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17.sp,
                                    color: Colors.purple),
                              ),
                              SizedBox(
                                height: 10.sp,
                              ),
                              Text(
                                'Order ID: JEIJI9892G',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp),
                              ),
                              SizedBox(
                                height: 10.sp,
                              ),
                              Text(
                                'Order total: ₹198.00',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Text(
                        '1.30 PM | Saturday 14 Feb',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16.sp),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Text(
                        'Ninja Delivery Point - 3 : Bigbazzar ',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16.sp),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Text(
                        'Show the QR code to delivery partner at delivery to authenticate your order',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16.sp),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      TextButton(
                          onPressed: () {}, child: const Text('Contact Us'))

                      // LottieBuilder.asset(
                      //   'assets/lottie/success.json',
                      //   height: 10.h,
                      // ),
                      // Text(
                      //   'Order successfully',
                      //   style: TextStyle(
                      //       color: Colors.green,
                      //       fontWeight: FontWeight.w500,
                      //       fontSize: 20.sp),
                      // ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.sp,
              ),
              Card(
                  child: Container(
                padding: EdgeInsets.all(15.sp),
                height: 15.h,
                width: 100.w,
                child: Stack(
                  children: [
                    Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'You have earned 20 Ninja Points',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18.sp),
                        ),
                        SizedBox(
                          height: 15.sp,
                        ),
                        Text(
                          'You can use ninja points for next order',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16.sp),
                        ),
                      ],
                    )),
                    LottieBuilder.asset(
                      'assets/lottie/celebration.json',
                      width: 100.w,
                    ),
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}
