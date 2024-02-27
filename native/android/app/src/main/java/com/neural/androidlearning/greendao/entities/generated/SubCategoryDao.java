package com.neural.androidlearning.greendao.entities.generated;

import java.util.List;
import android.database.Cursor;
import android.database.sqlite.SQLiteStatement;

import org.greenrobot.greendao.AbstractDao;
import org.greenrobot.greendao.Property;
import org.greenrobot.greendao.internal.DaoConfig;
import org.greenrobot.greendao.database.Database;
import org.greenrobot.greendao.database.DatabaseStatement;
import org.greenrobot.greendao.query.Query;
import org.greenrobot.greendao.query.QueryBuilder;

import com.neural.androidlearning.greendao.entities.SubCategory;

// THIS CODE IS GENERATED BY greenDAO, DO NOT EDIT.
/** 
 * DAO for table "SUB_CATEGORY".
*/
public class SubCategoryDao extends AbstractDao<SubCategory, Long> {

    public static final String TABLENAME = "SUB_CATEGORY";

    /**
     * Properties of entity SubCategory.<br/>
     * Can be used for QueryBuilder and for referencing column names.
     */
    public static class Properties {
        public final static Property Id = new Property(0, long.class, "id", true, "_id");
        public final static Property Name = new Property(1, String.class, "name", false, "NAME");
        public final static Property ParentCategoryId = new Property(2, long.class, "parentCategoryId", false, "PARENT_CATEGORY_ID");
    }

    private Query<SubCategory> category_SubCategoriesQuery;

    public SubCategoryDao(DaoConfig config) {
        super(config);
    }
    
    public SubCategoryDao(DaoConfig config, DaoSession daoSession) {
        super(config, daoSession);
    }

    /** Creates the underlying database table. */
    public static void createTable(Database db, boolean ifNotExists) {
        String constraint = ifNotExists? "IF NOT EXISTS ": "";
        db.execSQL("CREATE TABLE " + constraint + "\"SUB_CATEGORY\" (" + //
                "\"_id\" INTEGER PRIMARY KEY NOT NULL ," + // 0: id
                "\"NAME\" TEXT NOT NULL ," + // 1: name
                "\"PARENT_CATEGORY_ID\" INTEGER NOT NULL );"); // 2: parentCategoryId
    }

    /** Drops the underlying database table. */
    public static void dropTable(Database db, boolean ifExists) {
        String sql = "DROP TABLE " + (ifExists ? "IF EXISTS " : "") + "\"SUB_CATEGORY\"";
        db.execSQL(sql);
    }

    @Override
    protected final void bindValues(DatabaseStatement stmt, SubCategory entity) {
        stmt.clearBindings();
        stmt.bindLong(1, entity.getId());
        stmt.bindString(2, entity.getName());
        stmt.bindLong(3, entity.getParentCategoryId());
    }

    @Override
    protected final void bindValues(SQLiteStatement stmt, SubCategory entity) {
        stmt.clearBindings();
        stmt.bindLong(1, entity.getId());
        stmt.bindString(2, entity.getName());
        stmt.bindLong(3, entity.getParentCategoryId());
    }

    @Override
    public Long readKey(Cursor cursor, int offset) {
        return cursor.getLong(offset + 0);
    }    

    @Override
    public SubCategory readEntity(Cursor cursor, int offset) {
        SubCategory entity = new SubCategory( //
            cursor.getLong(offset + 0), // id
            cursor.getString(offset + 1), // name
            cursor.getLong(offset + 2) // parentCategoryId
        );
        return entity;
    }
     
    @Override
    public void readEntity(Cursor cursor, SubCategory entity, int offset) {
        entity.setId(cursor.getLong(offset + 0));
        entity.setName(cursor.getString(offset + 1));
        entity.setParentCategoryId(cursor.getLong(offset + 2));
     }
    
    @Override
    protected final Long updateKeyAfterInsert(SubCategory entity, long rowId) {
        entity.setId(rowId);
        return rowId;
    }
    
    @Override
    public Long getKey(SubCategory entity) {
        if(entity != null) {
            return entity.getId();
        } else {
            return null;
        }
    }

    @Override
    public boolean hasKey(SubCategory entity) {
        throw new UnsupportedOperationException("Unsupported for entities with a non-null key");
    }

    @Override
    protected final boolean isEntityUpdateable() {
        return true;
    }
    
    /** Internal query to resolve the "subCategories" to-many relationship of Category. */
    public List<SubCategory> _queryCategory_SubCategories(long parentCategoryId) {
        synchronized (this) {
            if (category_SubCategoriesQuery == null) {
                QueryBuilder<SubCategory> queryBuilder = queryBuilder();
                queryBuilder.where(Properties.ParentCategoryId.eq(null));
                queryBuilder.orderRaw("T.'_id' ASC");
                category_SubCategoriesQuery = queryBuilder.build();
            }
        }
        Query<SubCategory> query = category_SubCategoriesQuery.forCurrentThread();
        query.setParameter(0, parentCategoryId);
        return query.list();
    }

}