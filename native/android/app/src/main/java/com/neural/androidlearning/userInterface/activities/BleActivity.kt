package com.neural.androidlearning.userInterface.activities

import android.Manifest
import android.content.pm.PackageManager
import android.os.Bundle
import android.util.Log
import android.widget.Button
import androidx.activity.result.contract.ActivityResultContracts
import androidx.core.app.ActivityCompat
import com.neural.androidlearning.R
import com.neural.androidlearning.utility.BleHelper

class BleActivity : BaseActivity("BleActivity") {

    private var startBleButton: Button? = null
    private var stopBleButton: Button? = null
    private var bleHelper : BleHelper? = null
    private var requestBlePermissionLauncher = registerForActivityResult(
        ActivityResultContracts.RequestPermission()
    ) { isGranted: Boolean ->
        if (isGranted) {
            Log.i("BleActivity", "BLE request permission $isGranted")
        } else {
            // Explain to the user that the feature is unavailable because the
            // features requires a permission that the user has denied. At the
            // same time, respect the user's decision. Don't link to system
            // settings in an effort to convince the user to change their
            // decision.
        }
    }

    enum class ActivityRequest (val num: Int) {
        REQUEST_ENABLE_BT(1)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_ble)

        bleHelper = BleHelper(applicationContext)

        startBleButton = findViewById(R.id.button_start_ble)
        startBleButton?.setOnClickListener {
            startBle()
        }

        stopBleButton = findViewById(R.id.button_stop_ble)
        stopBleButton?.setOnClickListener {
            stopBle()
        }
    }

    override fun onStop() {
        super.onStop()
        bleHelper?.stopBle()
    }

    private fun startBle() {
        if (!requestBlePermission()) {
            return
        }
        bleHelper?.startBle()
    }

    private fun stopBle() {
        if (!requestBlePermission()) {
            return
        }
        bleHelper?.stopBle()
    }

    private fun requestBlePermission(): Boolean {
        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.BLUETOOTH) != PackageManager.PERMISSION_GRANTED) {
            requestBlePermissionLauncher.launch(android.Manifest.permission.BLUETOOTH)
            return false
        } else if (ActivityCompat.checkSelfPermission(this, Manifest.permission.BLUETOOTH_SCAN) != PackageManager.PERMISSION_GRANTED) {
            requestBlePermissionLauncher.launch(android.Manifest.permission.BLUETOOTH_SCAN)
        } else if (ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
            requestBlePermissionLauncher.launch(android.Manifest.permission.ACCESS_COARSE_LOCATION)
        }
        return true
    }
}