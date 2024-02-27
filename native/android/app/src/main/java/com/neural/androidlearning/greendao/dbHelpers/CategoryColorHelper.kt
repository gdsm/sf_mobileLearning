package com.neural.androidlearning.greendao.dbHelpers

import com.neural.androidlearning.greendao.daoHelpers.GreenDaoHelper
import com.neural.androidlearning.greendao.daoHelpers.IDaoHelper
import com.neural.androidlearning.greendao.entities.CategoryColor
import com.neural.androidlearning.greendao.entities.generated.CategoryColorDao

enum class CategoryColors(val red: Int, val green: Int, val blue: Int) {
    COLOR1(255, 67, 0),
    COLOR2(200, 124, 56),
    COLOR3(255, 0, 43),
    COLOR4(98, 196, 208)
}

class CategoryColorHelper {
    private val daoHelper: IDaoHelper = GreenDaoHelper.getInstance()

    fun insert(color: CategoryColors) {
        val colorDao = daoHelper.getSession()?.categoryColorDao
        colorDao?.insert(CategoryColor(color.red, color.green, color.blue))
    }

    fun save(color: CategoryColors) {
        val colorDao = daoHelper.getSession()?.categoryColorDao
        colorDao?.save(CategoryColor(color.red, color.green, color.blue))
    }

    fun update(color: CategoryColors) {
        val colorDao = daoHelper.getSession()?.categoryColorDao
        val categoryColor = read(color)
        if (categoryColor != null) {
            colorDao?.update(categoryColor)
        }
    }

    fun read(color: CategoryColors): CategoryColor? {
        val colorDao = daoHelper.getSession()?.categoryColorDao
        val builder = colorDao?.queryBuilder()
        builder?.where(
            CategoryColorDao.Properties.Red.eq(color.red),
            CategoryColorDao.Properties.Green.eq(color.green),
            CategoryColorDao.Properties.Blue.eq(color.blue),
        )
        val colors = builder?.build()?.list()
        return if (colors != null && colors.isNotEmpty()) {
            colors.first()
        } else {
            return null
        }
    }

    fun delete(color: CategoryColors) {
        val colorDao = daoHelper.getSession()?.categoryColorDao
        val categoryColor = read(color)
        if (categoryColor != null) {
            colorDao?.delete(categoryColor)
        }
    }

    fun insertAll() {
        for (color in CategoryColors.values()) {
            insert(color)
        }
    }

    fun deleteAll() {
        for (color in CategoryColors.values()) {
            delete(color)
        }
    }

}