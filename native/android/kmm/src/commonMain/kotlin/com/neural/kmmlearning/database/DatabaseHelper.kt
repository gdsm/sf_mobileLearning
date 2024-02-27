package com.neural.kmmlearning.database

import com.neural.kmmlearning.database.shared.cache.Database
import com.neural.kmmlearning.shared.cache.Category

class DatabaseHelper(databaseFactory: DatabaseDriverFactory) {

    private val database = Database(databaseFactory)

    fun metadata() = database.metadata()

    fun insertCategory(id: Long, name: String) = database.insertCategory(id, name)
    fun getAllCategories(): List<Category> = database.getAllCategories()

    fun insertDefaultColors() {
        database.insertColor("16a085ff")
        database.insertColor("e74c3cff")
        database.insertColor("c0392bff")
        database.insertColor("8e44adff")
    }
    fun getAllColors() = database.getAllColors()
}