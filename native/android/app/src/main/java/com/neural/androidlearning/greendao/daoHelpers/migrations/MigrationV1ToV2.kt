package com.neural.androidlearning.greendao.daoHelpers.migrations

import org.greenrobot.greendao.database.Database

class MigrationV1ToV2: IDBMigration {

    override fun applyMigration(db: Database, currentVersion: Int): Int {
        return getMigratedVersion()
    }

    override fun getMigratedVersion() = 2
}