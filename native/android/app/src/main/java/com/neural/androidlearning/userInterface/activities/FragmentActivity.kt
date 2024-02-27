package com.neural.androidlearning.userInterface.activities

import android.os.Bundle
import android.util.Log
import android.widget.*
import com.neural.androidlearning.R
import com.neural.androidlearning.userInterface.fragments.BaseFragment
import com.neural.androidlearning.userInterface.fragments.FirstFragment
import com.neural.androidlearning.userInterface.fragments.SecondFragment

class FragmentActivity : BaseActivity("Fragment Activity") {

    private var firstButton: Button? = null
    private var secondButton: Button? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_fragment)

        firstButton = findViewById(R.id.firstFragmentButton)
        secondButton = findViewById(R.id.secondFragmentButton)

        firstButton?.setOnClickListener {
            showActivity(1)
        }
        secondButton?.setOnClickListener {
            showActivity(2)
        }
    }

    private fun showActivity(count: Int) {
        when (count) {
            1 -> {
                loadFragment(FirstFragment.newInstance("First", "Fragment"))
            }
            2 -> {
                loadFragment(SecondFragment.newInstance())
            }
            else -> {
                Log.w("FragmentActivity", "Unknown fragment")
            }
        }
    }

    private fun loadFragment(fragment: BaseFragment) {
        val fm = supportFragmentManager
        val fragmentTransaction = fm.beginTransaction()
        fragmentTransaction.replace(R.id.frameLayout, fragment)
        fragmentTransaction.commit()
    }
}