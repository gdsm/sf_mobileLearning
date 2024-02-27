package com.neural.androidlearning

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import com.neural.androidlearning.utility.FirstNetworkRequest
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import java.util.concurrent.Future

class NetworkRequestActivity : AppCompatActivity() {

    private var btnSend: Button? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_network_request)

        btnSend = findViewById(R.id.button_send_network_request)
        btnSend?.setOnClickListener {
            Log.i("NetworkRequestActivity", "Sending network request")
            sendNetworkRequest()
        }
    }

    private fun sendNetworkRequest() {
        GlobalScope.launch {
            val request = FirstNetworkRequest()
            val r: Unit = request.sendRequest()
        }
    }
}