import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock));

mixin LocalStorageHelper {
  // Save Token
  Future<void> saveToken({required String token}) async {
    storage.write(key: "fcm_token_key", value: token);
    await storage.write(
        key: "fcm_token_key_date", value: DateTime.now().toString());
  }

  // Retrieve Token
  Future<String> retrieveToken() async {
    final storedFcmkey = await storage.read(key: "fcm_token_key") ?? "";
    final storedFcmkeyDate = await storage.read(key: "fcm_token_key_date");
    return storedFcmkey;
  }

  // Retrieve Token Date
  Future<String> retrieveTokenDate() async {
    final storedFcmkeyDate =
        await storage.read(key: "fcm_token_key_date") ?? "";
    return storedFcmkeyDate;
  }
}
