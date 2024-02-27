package com.neural.androidlearning.userInterface.activities

import android.os.Bundle
import android.util.Log
import androidx.appcompat.app.AppCompatActivity
import java.util.jar.Manifest

val TAG = "Android Learning"

open class BaseActivity(val name: String): AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.i(name, "onCreate")
    }

    override fun onStart() {
        super.onStart()
        Log.i(name, "onStart")
    }

    override fun onRestart() {
        super.onRestart()
        Log.i(name, "onRestart")
    }

    override fun onResume() {
        super.onResume()
        Log.i(name, "onResume")
    }

    override fun onPause() {
        super.onPause()
        Log.i(name, "onPause")
    }

    override fun onStop() {
        super.onStop()
        Log.i(name, "onStop")
    }

    override fun onDestroy() {
        super.onDestroy()
        Log.i(name, "onDestroy")
    }
}