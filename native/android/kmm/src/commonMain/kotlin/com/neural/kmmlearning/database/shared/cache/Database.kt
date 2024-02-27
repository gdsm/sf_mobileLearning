package com.neural.kmmlearning.database.shared.cache

import com.neural.kmmlearning.database.DatabaseDriverFactory
import com.neural.kmmlearning.shared.cache.Category
import com.neural.kmmlearning.shared.cache.Color
import com.squareup.sqldelight.db.migrateWithCallbacks


internal class Database(databaseDriverFactory: DatabaseDriverFactory) {
    private val database = AppDatabase(databaseDriverFactory.createDriver())
    private val dbQuery = database.appDatabaseQueries

    internal fun clearDatabase() {
        dbQuery.transaction {
            dbQuery.removeCategory()
            dbQuery.removeCategory()
        }
    }

    fun metadata(): String = "SQLDelight - AppDatabase ${database.toString()}"

    // ---- Category
    internal fun getAllCategories(): List<Category> {
        return dbQuery.selectAllCategories().executeAsList()
    }

    internal fun getCategory(id: Long): Category? {
        return dbQuery.selectCategoryById(id).executeAsOneOrNull()
    }

    internal fun insertCategory(id: Long, name: String) {
        if (getCategory(id) == null) {
            dbQuery.transaction {
                dbQuery.insertCategory(id, name)
            }
        } else {
            updateCategory(id, name)
        }
    }

    internal fun updateCategory(id: Long, name: String) {
        dbQuery.transaction {
            dbQuery.updateCategory(name, id)
        }
    }

    //------ Colors-------//

    internal fun getColor(rgba: String) : Color? {
        return dbQuery.selectColor(rgba).executeAsOneOrNull()
    }

    internal fun getAllColors(): List<Color> {
        return dbQuery.selectAllColors().executeAsList()
    }

    internal fun insertColor(rgba: String) {
        if (getColor(rgba) == null) {
            dbQuery.transaction {
                dbQuery.insertColor(rgba)
            }
        }
    }

    internal fun deleteColor(rgba: String) {
        dbQuery.transaction {
            dbQuery.removeColor(rgba)
        }
    }
}