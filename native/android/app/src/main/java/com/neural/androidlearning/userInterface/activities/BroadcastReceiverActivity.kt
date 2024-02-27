package com.neural.androidlearning.userInterface.activities

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import androidx.localbroadcastmanager.content.LocalBroadcastManager
import com.neural.androidlearning.R

class BroadcastReceiverActivity : AppCompatActivity() {

    private var btnReceiver: Button? = null
    private var localBroadcastManager: LocalBroadcastManager? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_broadcast_receiver)

        btnReceiver = findViewById(R.id.button_broadcast_local)
        localBroadcastManager = LocalBroadcastManager.getInstance(applicationContext);


        btnReceiver?.setOnClickListener {
            val intent = Intent("Custom_local_broadcast")
            localBroadcastManager?.sendBroadcast(intent)
        }
    }
}