package com.neural.kmmlearning.database

import com.squareup.sqldelight.db.SqlDriver
import com.neural.kmmlearning.database.shared.cache.AppDatabase
import com.squareup.sqldelight.drivers.native.NativeSqliteDriver

actual class DatabaseDriverFactory {
    actual fun createDriver(): SqlDriver {
        return NativeSqliteDriver(AppDatabase.Schema, "AppDatabase.db")
    }
}