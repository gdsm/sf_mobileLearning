package com.neural.androidlearning.greendao.dbHelpers

import com.neural.androidlearning.greendao.daoHelpers.GreenDaoHelper
import com.neural.androidlearning.greendao.daoHelpers.IDaoHelper
import com.neural.androidlearning.greendao.entities.Category
import com.neural.androidlearning.greendao.entities.generated.CategoryDao

class CategoryHelper {

    private val daoHelper: IDaoHelper = GreenDaoHelper.getInstance()

    fun prepareDatabase() {
        val categoryColorHelper = CategoryColorHelper()
        categoryColorHelper.insertAll()
        insert(101, "Kitchen", categoryColorHelper.read(CategoryColors.COLOR1)!!.id)
        insert(102, "Room", categoryColorHelper.read(CategoryColors.COLOR2)!!.id)
        insert(103, "Cooling", categoryColorHelper.read(CategoryColors.COLOR3)!!.id)
        insert(104, "Heating", categoryColorHelper.read(CategoryColors.COLOR4)!!.id)
        insert(105, "Lights", categoryColorHelper.read(CategoryColors.COLOR2)!!.id)

        val subCategoryHelper = SubCategoryHelper()
        subCategoryHelper.insert(1, "Kitchen 1")
        subCategoryHelper.insert(2, "Kitchen 2")
        subCategoryHelper.read(1)!!.setParentCategoryId(read(101)!!.id)
        subCategoryHelper.read(2)!!.setParentCategoryId(read(101)!!.id)
    }

    fun insert(id: Long, name: String, colorId: Long) {
        val dao = daoHelper.getSession()?.categoryDao
        dao?.insert(Category(id,  name, colorId))
    }

    fun save(id: Long, name: String, colorId: Long) {
        val dao = daoHelper.getSession()?.categoryDao
        dao?.save(Category(id,  name, colorId))
    }

    fun update(id: Long, name: String, colorId: Long) {
        val dao = daoHelper.getSession()?.categoryDao
        val entity = read(id)
        if (entity != null) {
            entity.colorId = colorId
            entity.name = name
            dao?.update(entity)
        }
    }

    fun update(id: Long, colorId: Long) {
        val dao = daoHelper.getSession()?.categoryDao
        val entity = read(id)
        if (entity != null) {
            entity.colorId = colorId
            dao?.update(entity)
        }
    }

    fun read(id: Long): Category? {
        val dao = daoHelper.getSession()?.categoryDao
        val builder = dao?.queryBuilder()
        builder?.where(
            CategoryDao.Properties.Id.eq(id)
        )
        val list = builder?.build()?.list()
        return if (list != null && list.isNotEmpty()) {
            list.first()
        } else {
            return null
        }
    }

    fun delete(id: Long) {
        val dao = daoHelper.getSession()?.categoryDao
        val entity = read(id)
        if (entity != null) {
            dao?.delete(entity)
        }
    }
}