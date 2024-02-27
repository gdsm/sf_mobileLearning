package com.neural.androidlearning.receiver

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log

public class LocalBroadcastReceiver: BroadcastReceiver() {

    companion object {
        val receiverKey = "LocalBroadcastReceiver"
    }
    override fun onReceive(p0: Context?, p1: Intent?) {
        val data = p1?.getStringExtra(LocalBroadcastReceiver.receiverKey)
        Log.i("LocalBroadcastReceiver", "Received data $data")
    }
}