import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ninjaa/features/authentication/data/auth_info_model.dart';
import 'package:ninjaa/features/authentication/data/authentication_notifier.dart';
import 'package:ninjaa/utils/common_library.dart';
import 'package:ninjaa/utils/sim_retriver.dart';
import 'package:ninjaa/widgets/custom_button.dart';
import 'package:ninjaa/widgets/custom_text_field.dart';

class SignupView extends ConsumerStatefulWidget {
  const SignupView({super.key});

  @override
  ConsumerState<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends ConsumerState<SignupView> {
  TextEditingController phoneNumberController = TextEditingController();

  FocusNode mobileNumberNode = FocusNode();
  bool isEnabled = false;
  bool isLoading = false;

  Future<void> sendOtp() async {
    setState(() {
      isLoading = true;
    });
    final notifier = ref.read(authNotifierProvider.notifier);
    await notifier.signInWithPhoneNumber(
      phoneNumberController.text,
      onVerificationCompleted: (credential) {
        log('Credential is ${credential.toString()}');
        setState(() {
          isLoading = false;
        });
      },
      codeSent: (verificationId, resendToken) {
        setState(() {
          isLoading = false;
        });

        AuthInfoDto dto = AuthInfoDto(
            mobileNumber: "+91${phoneNumberController.text}",
            verificationId: verificationId,
            resendToken: resendToken ?? 0);
        context.goNamed(otp, extra: dto);
      },
      onVerificationFailed: (failedMessage) {
        log("Verification  msg is $failedMessage");
        Fluttertoast.showToast(msg: failedMessage);
        setState(() {
          isLoading = false;
        });
      },
    );
  }

  List<String> simNumbers = [];

  void fetchSimNumbers() async {
    try {
      List<String> response = await SimInfoRetriever.getSimNumbers();
      setState(() {
        simNumbers = response;
      });
      if (simNumbers.isNotEmpty) {
        showNumber();
      }
    } catch (e) {
      log("Error: $e");
    }
  }

  void showNumber() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.sp))),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: simNumbers
                    .map((e) => InkWell(
                          onTap: () {
                            setState(() {
                              phoneNumberController.text =
                                  e.substring(e.length - 10);
                            });
                            context.pop();
                          },
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.sp, vertical: 10.sp),
                              child: Text(e.substring(e.length - 10))),
                        ))
                    .toList(),
              ),
              SizedBox(
                height: 5.sp,
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      isEnabled = true;
                    });
                  },
                  child: const Text('None of the above'))
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 100.h,
        child: AbsorbPointer(
          absorbing: isLoading,
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                height: 45.h,
                color: context.colorScheme.primary,
                child: Center(
                  child: Text(
                    'Ninja Mart',
                    style: context.textScheme.titleLarge!
                        .copyWith(color: context.colorScheme.onPrimary),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15.sp,
                    ),
                    SizedBox(
                      width: 70.w,
                      child: Text(
                        'India\'s #1 Entertainment and Fun Activity App',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: context.textScheme.titleMedium!.copyWith(),
                      ),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Divider(
                            endIndent: 3.w,
                          ),
                        ),
                        Text(
                          'Log in or sign up',
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: context.textScheme.bodyMedium!.copyWith(),
                        ),
                        Expanded(
                          child: Divider(
                            indent: 3.w,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.sp,
                    ),
                    CustomTextField(
                        // enabled: true,
                        style: TextStyle(fontSize: 16.sp),
                        onTap: () => fetchSimNumbers(),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0.sp, horizontal: 10.sp),

                        // focusNode: mobileNumberNode,
                        // onChanged: (val) {
                        //   if (val.length == 10) {
                        //     mobileNumberNode.unfocus();
                        //   }
                        // },
                        label: 'Enter Mobile Number',
                        inputFormatter: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        prefix: Text(
                          '+91 ',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        controller: phoneNumberController,
                        keyboardType: TextInputType.number),
                    SizedBox(
                      height: 20.sp,
                    ),
                    CustomButton(
                      isLoading: isLoading,
                      label: "Continue",
                      onTap: () => sendOtp(),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 35.w,
                          child: const Divider(),
                        ),
                        Text(
                          'or',
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: context.textScheme.bodyMedium!.copyWith(),
                        ),
                        SizedBox(
                          width: 35.w,
                          child: const Divider(),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Container(
                      height: 5.h,
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.sp),
                          border: Border.all(width: 2.sp)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'assets/images/google_icon.png',
                            width: 8.w,
                          ),
                          Text(
                            'Continue with Google',
                            style: TextStyle(fontSize: 17.5.sp),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Text.rich(
                      TextSpan(
                          text: 'By continuing, you agree to our \n',
                          children: [
                            TextSpan(
                              text: 'Terms of service ',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: context.colorScheme.primary,
                                  fontSize: 15.sp),
                            ),
                            TextSpan(
                              text: '  ',
                            ),
                            TextSpan(
                              text: 'Privacy policy',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 15.sp,
                                  color: context.colorScheme.primary),
                            ),
                            TextSpan(
                              text: '  ',
                            ),
                            TextSpan(
                              text: 'Content Policy',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: context.colorScheme.primary,
                                  fontSize: 15.sp),
                            )
                          ]),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
