import 'package:ninjaa/utils/common_library.dart';

@immutable
class AuthInfoDto {
  final String mobileNumber;
  final String verificationId;
  final int resendToken;

  const AuthInfoDto(
      {required this.mobileNumber,
      required this.verificationId,
      required this.resendToken});

  @override
  String toString() {
    return "MobileNumber : $mobileNumber, verificatioId : $verificationId, resendToken : $resendToken";
  }
}
