package io.github.kabirnayeem99.random_user_method_channel.presentation

import android.content.Context
import android.os.Bundle
import android.os.PersistableBundle
import dagger.hilt.android.AndroidEntryPoint
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugins.GeneratedPluginRegistrant
import io.github.kabirnayeem99.random_user_method_channel.domain.repositories.RandomUserRepository
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import javax.inject.Inject

const val RANDOM_USER_CHANNEL = "io.github.kabirnayeem99/randomUser"
const val GET_USER_TASK = "get_user_task";

@AndroidEntryPoint
class MainActivity : FlutterFragmentActivity(), MethodCallHandler, FlutterPlugin {

    @Inject
    lateinit var randomUserRepository: RandomUserRepository

    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        super.onCreate(savedInstanceState, persistentState)
        flutterEngine?.let { engine -> GeneratedPluginRegistrant.registerWith(engine) }
    }

    private val mainScope = CoroutineScope(Dispatchers.Main)
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, RANDOM_USER_CHANNEL)
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger, RANDOM_USER_CHANNEL
        ).setMethodCallHandler { call, result ->
            mainScope.launch {
                when (call.method) {
                    GET_USER_TASK -> {
                        var users = ""
                        withContext(Dispatchers.IO) {
                            users = randomUserRepository.getRandomUsersJson()
                        }
                        result.success(users)
                    }
                    else -> result.success("Nothing")
                }
            }
        }
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        mainScope.launch {
            when (call.method) {
                GET_USER_TASK -> {
                    var users = ""
                    withContext(Dispatchers.IO) {
                        users = randomUserRepository.getRandomUsersJson()
                    }
                    result.success(users)
                }
            }
        }
    }

}