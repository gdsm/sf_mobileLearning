package com.neural.androidlearning.utility

import android.annotation.SuppressLint
import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothManager
import android.bluetooth.le.ScanCallback
import android.bluetooth.le.ScanResult
import android.content.Context
import android.util.Log


class BleHelper(context: Context) : ScanCallback() {
    private var manager: BluetoothManager? = null
    private var adapter: BluetoothAdapter? = null

    init {
        manager = context.getSystemService(Context.BLUETOOTH_SERVICE) as BluetoothManager?
        adapter = manager?.adapter
    }

    @SuppressLint("MissingPermission")
    fun startBle() {
        if (!isEnabled()) {
            return
        }
        adapter?.bluetoothLeScanner?.startScan(this)
    }

    @SuppressLint("MissingPermission")
    fun stopBle() {
        if (!isEnabled()) {
            return
        }
        adapter?.bluetoothLeScanner?.stopScan(this)
    }

    // Scan callback methods
    override fun onScanResult(callbackType: Int, result: ScanResult?) {
        Log.i("BleHelper", "callbackType : $callbackType")
    }

    override fun onBatchScanResults(results: List<ScanResult?>?) {
        Log.i("BleHelper", "Scan results  : $results")
    }

    override fun onScanFailed(errorCode: Int) {
        Log.i("BleHelper", "Scan failed  : $errorCode")
    }

    private fun isEnabled(): Boolean {
        if ((adapter == null) || (adapter?.isEnabled == false)) {
            return false
        }
        return true
    }
}