package com.neural.androidlearning.userInterface.activities

import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.widget.Button
import com.neural.androidlearning.R
import com.neural.androidlearning.TopicsActivity
import com.neural.kmmlearning.HelloKMM

class MainActivity : BaseActivity("MainActivity") {
    private var btnStart: Button? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        btnStart = findViewById(R.id.startButton)
        btnStart?.setOnClickListener {
            println("Lets Start learning android !!")
            showList()
        }

        Log.i(TAG, "------ ${HelloKMM().hello("Hello from android native")}")
    }

    private fun showList() {
        val intent = Intent(this, TopicsActivity::class.java)
        startActivity(intent)
    }
}