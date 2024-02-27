package com.neural.androidlearning.greendao.daoHelpers.migrations

import org.greenrobot.greendao.database.Database

interface IDBMigration {
    fun applyMigration(db: Database, currentVersion: Int): Int
    fun getMigratedVersion(): Int
}