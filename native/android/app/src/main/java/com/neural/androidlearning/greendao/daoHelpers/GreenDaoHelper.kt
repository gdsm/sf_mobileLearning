package com.neural.androidlearning.greendao.daoHelpers

import android.content.Context
import com.neural.androidlearning.greendao.entities.generated.DaoMaster
import com.neural.androidlearning.greendao.entities.generated.DaoSession
import java.util.concurrent.atomic.AtomicReference

class GreenDaoHelper: IDaoHelper {

    companion object {
        private val greenDaoInstance: AtomicReference<GreenDaoHelper?> = AtomicReference(null)
        init {
            greenDaoInstance.compareAndSet(null, GreenDaoHelper())
        }
        fun getInstance() : IDaoHelper {
            return greenDaoInstance.get() ?: throw NullPointerException("Failed to initialize GreenDao")
        }
    }

    private var mOpenHelper: DaoMaster.OpenHelper? = null
    private lateinit var databaseName: String
    private var daoSession: DaoSession? = null

    override fun openDatabase(databaseName: String, appContext: Context) {
        if ((databaseName.isNotEmpty()) && (mOpenHelper == null)) {
            initialize(databaseName, appContext)
        }
    }

    override fun closeDatabase() {
        if (daoSession != null) {
            daoSession?.clear()
            daoSession = null
        }
        if (mOpenHelper != null) {
            mOpenHelper?.close()
            mOpenHelper = null
        }
    }

    override fun getSession(): DaoSession? {
        return daoSession
    }

    private fun initialize(databaseName: String, appContext: Context) {
        val dbName = databaseName.lowercase()
        mOpenHelper = UpgradableDaoHelper(appContext, dbName, null)
        val db = mOpenHelper?.writableDb
        daoSession = DaoMaster(db).newSession()
        this.databaseName = dbName
    }
}