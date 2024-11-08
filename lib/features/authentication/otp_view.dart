import 'package:fluttertoast/fluttertoast.dart';
import 'package:ninjaa/features/authentication/data/auth_info_model.dart';
import 'package:ninjaa/features/authentication/data/authentication_notifier.dart';
import 'package:ninjaa/utils/common_library.dart';
import 'package:ninjaa/widgets/custom_button.dart';
import 'package:pinput/pinput.dart';

class OtpView extends ConsumerStatefulWidget {
  final AuthInfoDto authInfoDto;

  const OtpView({super.key, required this.authInfoDto});

  @override
  ConsumerState<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends ConsumerState<OtpView> {
  final pinController = TextEditingController();

  bool isLoading = false;

  Future<void> verifyOtp() async {
    setState(() {
      isLoading = true;
    });
    final authNotifier = ref.read(authNotifierProvider.notifier);
    final isVerified = await authNotifier.verifyOtp(
        verificationId: widget.authInfoDto.verificationId,
        smsCode: pinController.text);

    if (isVerified) {
      setState(() {
        isLoading = false;
      });
      // ignore: use_build_context_synchronously
      context.goNamed(route);
    } else {
      setState(() {
        isLoading = false;
      });
      context.goNamed(route);
      // Fluttertoast.showToast(msg: "Incorrect OTP");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'OTP Verification',
        style: TextStyle(color: context.colorScheme.onSurface),
      )),
      body: Container(
        width: 100.w,
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            SizedBox(
              height: 20.sp,
            ),
            Text(
              'We have sent a verification code to \n ${widget.authInfoDto.mobileNumber}',
              style: const TextStyle(
                height: 1.7,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 25.sp,
            ),
            Pinput(
              controller: pinController,
              length: 6,
              onChanged: (val) {},
            ),
            SizedBox(
              height: 20.sp,
            ),
            CustomButton(
                isLoading: isLoading,
                label: "Verify",
                onTap: () {
                  verifyOtp();
                }),
            SizedBox(
              height: 10.sp,
            ),
            TextButton(
                onPressed: () {},
                child: const Text('Check text messages for your OTP')),
            SizedBox(
              height: 10.sp,
            ),
            Text.rich(TextSpan(
                children: [
                  TextSpan(
                      text: 'Resend SMS',
                      style: TextStyle(color: context.colorScheme.primary))
                ],
                text: 'Didn\'t get the OTP?  ',
                style: const TextStyle(fontWeight: FontWeight.w500)))
          ],
        ),
      ),
    );
  }
}
