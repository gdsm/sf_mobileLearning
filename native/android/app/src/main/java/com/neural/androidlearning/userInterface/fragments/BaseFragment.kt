package com.neural.androidlearning.userInterface.fragments

import android.content.Context
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment

open class BaseFragment(val name: String): Fragment() {
    override fun onAttach(context: Context) {
        super.onAttach(context)
        Log.i(name, "onAttach")
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.i(name, "onCreate")
    }

//    override fun onCreateView(
//        inflater: LayoutInflater,
//        container: ViewGroup?,
//        savedInstanceState: Bundle?
//    ): View? {
//        Log.i(name, "onCreateView")
//        return super.onCreateView(inflater, container, savedInstanceState)
//    }

    override fun onStart() {
        super.onStart()
        Log.i(name, "onStart")
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

    override fun onDestroyView() {
        super.onDestroyView()
        Log.i(name, "onDestroyView")
    }

    override fun onDestroy() {
        super.onDestroy()
        Log.i(name, "onDestroy")
    }

    override fun onDetach() {
        super.onDetach()
        Log.i(name, "onDetach")
    }
}