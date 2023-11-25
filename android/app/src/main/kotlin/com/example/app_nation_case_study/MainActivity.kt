package com.example.app_nation_case_study

import android.os.Build
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, MainActivity.Companion.CHANNEL)
            .setMethodCallHandler { call: MethodCall, result: MethodChannel.Result ->
                if (call.method == "getAndroidVersion") {
                    val androidVersion = Build.VERSION.RELEASE
                    result.success(androidVersion)
                } else {
                    result.notImplemented()
                }
            }
    }

    companion object {
        private const val CHANNEL = "platform_info"
    }
}
