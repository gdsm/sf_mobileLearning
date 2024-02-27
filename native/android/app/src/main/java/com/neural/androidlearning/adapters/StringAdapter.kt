package com.neural.androidlearning.adapters

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.*
import com.neural.androidlearning.R

data class StringAdapterDataSource(val value: String, val id: Int);

class StringAdapter(private val list: List<StringAdapterDataSource>, val context: Context): BaseAdapter() {
    override fun getCount(): Int {
        return list.count()
    }

    override fun getItem(p0: Int): Any {
        return list[p0]
    }

    override fun getItemId(p0: Int): Long {
        return list[p0].id.toLong()
    }

    override fun getView(p0: Int, p1: View?, p2: ViewGroup?): View {
        val view = LayoutInflater.from(context).inflate(R.layout.title_view,  p2, false)
        val textView = view.findViewById<TextView>(R.id.TextView)
        textView.text = list[p0].value
        return view
    }
}