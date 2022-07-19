package com.crazymt.parseplist.parse_plist

import android.content.Context
import androidx.annotation.NonNull
import com.dd.plist.*
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.io.File


/** ParsePlistPlugin */
class ParsePlistPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private var context: Context? = null
    private var TAG: String = "MTMTMT"

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext
        channel =
            MethodChannel(flutterPluginBinding.binaryMessenger, "parse_plist")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(
        @NonNull call: MethodCall,
        @NonNull result: Result
    ) {
        if (call.method == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        } else if (call.method == "getDocumentPath") {
            result.success(context?.filesDir?.absolutePath)
        } else if (call.method == "getPlist") {
            try {
                val filePath: String? = call.argument("filePath")
                val file = File("$filePath")
                val rootDict = PropertyListParser.parse(file) as NSDictionary
                result.success(rootDict.toJavaObject())
            } catch (ex: Exception) {
                ex.printStackTrace()
                result.error("0", ex.toString(), ex.toString())
            }
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
