import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class SimInfoRetriever {
  static const platform = MethodChannel('simInfoChannel');

  static Future<List<String>> getSimNumbers() async {
    List<String> simNumbers = [];

    // Request permissions before accessing the SIM info
    var status = await Permission.phone.status;
    if (!status.isGranted) {
      status = await Permission.phone.request();
      if (!status.isGranted) {
        throw Exception("Permission not granted");
      }
    }

    try {
      final List<dynamic> result = await platform.invokeMethod('getSimNumbers');
      simNumbers = result.cast<String>();
    } on PlatformException catch (e) {
      print("Failed to get SIM numbers: '${e.message}'.");
    }

    return simNumbers;
  }
}
