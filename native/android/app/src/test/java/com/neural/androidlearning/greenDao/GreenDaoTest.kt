package com.neural.androidlearning.greenDao

import android.content.Context
import androidx.test.core.app.ApplicationProvider
import com.neural.androidlearning.greendao.daoHelpers.GreenDaoHelper
import com.neural.androidlearning.greendao.dbHelpers.CategoryColorHelper
import com.neural.androidlearning.greendao.dbHelpers.CategoryColors
import com.neural.androidlearning.greendao.dbHelpers.CategoryHelper
import com.neural.androidlearning.greendao.dbHelpers.SubCategoryHelper
import org.junit.After
import org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner


@RunWith(RobolectricTestRunner::class)
class GreenDaoTest {

    private lateinit var context: Context

    @Before
    fun setup() {
        context = ApplicationProvider.getApplicationContext<Context>()
        GreenDaoHelper.getInstance().openDatabase("greendaoDB", context)
    }

    @After
    fun tearDown() {
        GreenDaoHelper.getInstance().closeDatabase()
    }

    @Test
    fun testDatabase() {
        addCategoryColors()
        addCategories()
        addSubCategories()
    }

    private fun addCategoryColors() {
        val categoryColorHelper = CategoryColorHelper()
        categoryColorHelper.insert(CategoryColors.COLOR1)
        categoryColorHelper.insert(CategoryColors.COLOR1)
        assertEquals( categoryColorHelper.read(CategoryColors.COLOR1)?.red, CategoryColors.COLOR1.red)
        assertEquals( categoryColorHelper.read(CategoryColors.COLOR1)?.green, CategoryColors.COLOR1.green)
        assertEquals( categoryColorHelper.read(CategoryColors.COLOR1)?.blue, CategoryColors.COLOR1.blue)

        categoryColorHelper.insert(CategoryColors.COLOR2)
        categoryColorHelper.insert(CategoryColors.COLOR3)

        assertEquals( categoryColorHelper.read(CategoryColors.COLOR1)?.red, CategoryColors.COLOR1.red)
        assertEquals( categoryColorHelper.read(CategoryColors.COLOR1)?.green, CategoryColors.COLOR1.green)
        assertEquals( categoryColorHelper.read(CategoryColors.COLOR1)?.blue, CategoryColors.COLOR1.blue)

        assertEquals( categoryColorHelper.read(CategoryColors.COLOR2)?.red, CategoryColors.COLOR2.red)
        assertEquals( categoryColorHelper.read(CategoryColors.COLOR2)?.green, CategoryColors.COLOR2.green)
        assertEquals( categoryColorHelper.read(CategoryColors.COLOR2)?.blue, CategoryColors.COLOR2.blue)

        assertEquals( categoryColorHelper.read(CategoryColors.COLOR3)?.red, CategoryColors.COLOR3.red)
        assertEquals( categoryColorHelper.read(CategoryColors.COLOR3)?.green, CategoryColors.COLOR3.green)
        assertEquals( categoryColorHelper.read(CategoryColors.COLOR3)?.blue, CategoryColors.COLOR3.blue)

        assertNull(categoryColorHelper.read(CategoryColors.COLOR4))

        categoryColorHelper.save(CategoryColors.COLOR4)
        assertEquals( categoryColorHelper.read(CategoryColors.COLOR4)?.red, CategoryColors.COLOR4.red)
        assertEquals( categoryColorHelper.read(CategoryColors.COLOR4)?.green, CategoryColors.COLOR4.green)
        assertEquals( categoryColorHelper.read(CategoryColors.COLOR4)?.blue, CategoryColors.COLOR4.blue)

        categoryColorHelper.save(CategoryColors.COLOR3)
        assertEquals( categoryColorHelper.read(CategoryColors.COLOR3)?.red, CategoryColors.COLOR3.red)
        assertEquals( categoryColorHelper.read(CategoryColors.COLOR3)?.green, CategoryColors.COLOR3.green)
        assertEquals( categoryColorHelper.read(CategoryColors.COLOR3)?.blue, CategoryColors.COLOR3.blue)
    }

    private fun addCategories() {
        val categoryHelper = CategoryHelper()
        val categoryColorHelper = CategoryColorHelper()

        // insert
        categoryHelper.insert(101, "C1", categoryColorHelper.read(CategoryColors.COLOR1)!!.id)
        assertNotNull(categoryHelper.read(101))
        // test color-id is correct
        assertEquals(categoryHelper.read(101)!!.colorId, categoryColorHelper.read(CategoryColors.COLOR1)!!.id)

        // delete
        categoryHelper.delete(101)
        assertNull(categoryHelper.read(101))

        categoryHelper.insert(102, "C1", categoryColorHelper.read(CategoryColors.COLOR2)!!.id)
        assertEquals(categoryHelper.read(102)!!.colorId, categoryColorHelper.read(CategoryColors.COLOR2)!!.id)
        // update color from id
        categoryHelper.update(102, categoryColorHelper.read(CategoryColors.COLOR1)!!.id)
        assertEquals(categoryHelper.read(102)!!.colorId, categoryColorHelper.read(CategoryColors.COLOR1)!!.id)

        categoryHelper.update(102, 1989273498723)
        assertEquals(categoryHelper.read(102)!!.colorId, 1989273498723)
        assertNull(categoryHelper.read(102)!!.color)

        categoryHelper.update(102, 1)
        assertEquals(categoryHelper.read(102)!!.colorId, 1L)
        assertEquals(categoryHelper.read(102)!!.colorId, categoryColorHelper.read(CategoryColors.COLOR1)!!.id)
    }

    private fun addSubCategories() {
        val categoryHelper = CategoryHelper()
        val subCategoryHelper = SubCategoryHelper()

        subCategoryHelper.insert(1, "S21")
        subCategoryHelper.insert(2, "S22")
        subCategoryHelper.insert(3, "S23")
        subCategoryHelper.update(1, 102)
        subCategoryHelper.update(2, 102)
        subCategoryHelper.update(3, 102)
        println("------ ${categoryHelper.read(102)?.getSubCategories()}")
        assertEquals(categoryHelper.read(102)?.subCategories?.count(), 3)

        categoryHelper.read(102)?.subCategories?.remove(subCategoryHelper.read(3))
        assertEquals(categoryHelper.read(102)!!.subCategories.count(), 2)

        assertEquals(subCategoryHelper.read(1)!!.parentCategoryId, 102)
        assertEquals(subCategoryHelper.read(2)!!.parentCategoryId, 102)
    }
}