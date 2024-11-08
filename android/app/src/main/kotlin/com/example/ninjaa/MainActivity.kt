package com.ninjafoods.app

import android.os.Bundle
import android.telephony.TelephonyManager
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "simInfoChannel"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        flutterEngine?.dartExecutor?.binaryMessenger?.let { messenger ->
            MethodChannel(messenger, CHANNEL).setMethodCallHandler { call, result ->
                if (call.method == "getSimNumbers") {
                    val simNumbers = getSimNumbers()
                    result.success(simNumbers)
                } else {
                    result.notImplemented()
                }
            }
        }
    }

    private fun getSimNumbers(): List<String> {
        val telephonyManager = getSystemService(TELEPHONY_SERVICE) as TelephonyManager
        val phoneNumbers = mutableListOf<String>()

        // Check permission for Android 6.0 and above
        if (checkSelfPermission(android.Manifest.permission.READ_PHONE_NUMBERS) == android.content.pm.PackageManager.PERMISSION_GRANTED) {
            val line1Number = telephonyManager.line1Number
            if (line1Number != null) {
                phoneNumbers.add(line1Number)
            }
        }
        return phoneNumbers
    }
}

