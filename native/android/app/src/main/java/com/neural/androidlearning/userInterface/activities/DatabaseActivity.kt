package com.neural.androidlearning.userInterface.activities

import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText
import com.neural.androidlearning.R
import com.neural.kmmlearning.database.DatabaseDriverFactory
import com.neural.kmmlearning.database.DatabaseHelper

class DatabaseActivity : BaseActivity("DatabaseActivity") {

    private lateinit var etCategoryId: EditText
    private lateinit var etCategoryName: EditText
    private lateinit var btnSave: Button
    private lateinit var btnFetchAll: Button

    private val databaseHelper = DatabaseHelper(DatabaseDriverFactory(this))

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        Log.i(TAG, databaseHelper.metadata())

        setContentView(R.layout.activity_database)

        etCategoryId = findViewById(R.id.etCategoryId)
        etCategoryName = findViewById(R.id.etCategoryName)

        btnSave = findViewById(R.id.btnDoneEntry)
        btnSave.setOnClickListener {
            saveEntry()
        }

        btnFetchAll = findViewById(R.id.btnGetCategories)
        btnFetchAll.setOnClickListener {
            getAllCategories()
            getAllColors()
        }

        databaseHelper.insertDefaultColors()
    }

    private fun saveEntry() {
        val id = etCategoryId.text.toString().toLongOrNull()
        val name = etCategoryName.text.toString()
        if (id != null) {
            databaseHelper.insertCategory(id, name)
        }
    }

    private fun getAllCategories() {
        val list = databaseHelper.getAllCategories()
        list.forEach {
            Log.i(TAG, "Category ${it.id} -- ${it.name}")
        }
    }

    private fun getAllColors() {
        val colors = databaseHelper.getAllColors()
        colors.forEach {
            Log.i(TAG, "Color ${it.rgba}")
        }
    }
}