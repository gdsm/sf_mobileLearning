package com.neural.androidlearning

import android.content.Intent
import com.neural.androidlearning.userInterface.activities.BaseActivity
import android.os.Bundle
import android.util.Log
import android.widget.*
import com.neural.androidlearning.adapters.StringAdapter
import com.neural.androidlearning.adapters.StringAdapterDataSource
import com.neural.androidlearning.userInterface.activities.*
import com.neural.androidlearning.utility.BonjourDiscovery

class TopicsActivity : BaseActivity("TopicsActivity") {

    private var listView: ListView? = null
    private var publisher: BonjourDiscovery? = null
    private var bonjour: BonjourDiscovery? = null

    private var list = arrayListOf<StringAdapterDataSource>(
        StringAdapterDataSource("Fragments", 1),
        StringAdapterDataSource("Network Request", 2),
        StringAdapterDataSource("Broadcast receiver", 3),
        StringAdapterDataSource("BLE Activity", 4),
        StringAdapterDataSource("SQL Delight", 5),
        StringAdapterDataSource("Bonjour Publish", 6),
        StringAdapterDataSource("Bonjour Search", 7),
    )

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_topics)

        listView = findViewById(R.id.topicsListView)
        listView?.adapter = StringAdapter(list, applicationContext)

        listView?.setOnItemClickListener { _, _, i, _ ->
            when (i) {
                0 -> {
                    Log.i("TopicsActivity", "Fragment topic")
                    showFragmentActivity()
                } 1 -> {
                    Log.i("NetworkActivity", "Network request topic")
                    showNetworkRequestActivity()
                } 2 -> {
                    Log.i("Broadcast receiver activity", "Broadcast receiver")
                    showBroadcastReceiverActivity()
                } 3 -> {
                    Log.i("Bluetooth Activity", "Experimental activity")
                    startBluetoothActivity()
                } 4 -> {
                    Log.i(TAG, "SQL Delight")
                    startDatabaseActivity()
                } 5 -> {
                    Log.i(TAG, "Bonjour publish")
                    publisher = BonjourDiscovery(this)
                    publisher?.register()

                } 6 -> {
                    Log.i(TAG, "Bonjour search")
                    bonjour?.stopDiscovery()
                    bonjour = BonjourDiscovery(this)
                    bonjour?.search()
                }
                else -> {
                    Log.i("TopicsActivity", "Unknown selection $i")
                }
            }
        }
    }

    private fun showFragmentActivity() {
        val intent = Intent(this, FragmentActivity::class.java)
        startActivity(intent)
    }

    private fun showNetworkRequestActivity() {
        val intent = Intent(this, NetworkRequestActivity::class.java)
        startActivity(intent)
    }

    private fun showBroadcastReceiverActivity() {
        val intent = Intent(this, BroadcastReceiverActivity::class.java)
        startActivity(intent)
    }

    private fun startBluetoothActivity() {
        val intent = Intent(this, BleActivity::class.java)
        startActivity(intent)
    }

    private fun startDatabaseActivity() {
        val intent = Intent(this, DatabaseActivity::class.java)
        startActivity(intent)
    }
}