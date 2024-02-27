package com.neural.androidlearning.greendao.dbHelpers

import com.neural.androidlearning.greendao.daoHelpers.GreenDaoHelper
import com.neural.androidlearning.greendao.daoHelpers.IDaoHelper
import com.neural.androidlearning.greendao.entities.SubCategory
import com.neural.androidlearning.greendao.entities.generated.SubCategoryDao

class SubCategoryHelper {

    private val daoHelper: IDaoHelper = GreenDaoHelper.getInstance()

    fun insert(id: Long, name: String) {
        val dao = daoHelper.getSession()?.subCategoryDao
        dao?.insert(SubCategory(id, name))
    }

    fun save(id: Long, name: String) {
        val dao = daoHelper.getSession()?.subCategoryDao
        dao?.save(SubCategory(id,  name))
    }

    fun update(id: Long, parentCategoryId: Long) {
        val dao = daoHelper.getSession()?.subCategoryDao
        val entity = read(id)
        if (entity != null) {
            entity.setParentCategoryId(parentCategoryId)
            dao?.update(entity)
        }
    }

    fun read(id: Long): SubCategory? {
        val dao = daoHelper.getSession()?.subCategoryDao
        val builder = dao?.queryBuilder()
        builder?.where(
            SubCategoryDao.Properties.Id.eq(id)
        )
        val list = builder?.build()?.list()
        return if (list != null && list.isNotEmpty()) {
            list.first()
        } else {
            return null
        }
    }

    fun delete(id: Long) {
        val dao = daoHelper.getSession()?.subCategoryDao
        val entity = read(id)
        if (entity != null) {
            dao?.delete(entity)
        }
    }
}