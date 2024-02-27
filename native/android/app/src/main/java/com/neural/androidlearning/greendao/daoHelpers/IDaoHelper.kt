package com.neural.androidlearning.greendao.daoHelpers

import android.content.Context
import com.neural.androidlearning.greendao.entities.generated.DaoSession

interface IDaoHelper {
    fun openDatabase(databaseName: String, appContext: Context)
    fun closeDatabase()

    fun getSession(): DaoSession?
}