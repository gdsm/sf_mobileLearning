package com.neural.androidlearning.greendao.entities.generated;

import android.database.Cursor;
import android.database.sqlite.SQLiteStatement;

import org.greenrobot.greendao.AbstractDao;
import org.greenrobot.greendao.Property;
import org.greenrobot.greendao.internal.DaoConfig;
import org.greenrobot.greendao.database.Database;
import org.greenrobot.greendao.database.DatabaseStatement;

import com.neural.androidlearning.greendao.entities.CategoryColor;

// THIS CODE IS GENERATED BY greenDAO, DO NOT EDIT.
/** 
 * DAO for table "CATEGORY_COLOR".
*/
public class CategoryColorDao extends AbstractDao<CategoryColor, Long> {

    public static final String TABLENAME = "CATEGORY_COLOR";

    /**
     * Properties of entity CategoryColor.<br/>
     * Can be used for QueryBuilder and for referencing column names.
     */
    public static class Properties {
        public final static Property Id = new Property(0, Long.class, "id", true, "_id");
        public final static Property Red = new Property(1, int.class, "red", false, "RED");
        public final static Property Green = new Property(2, int.class, "green", false, "GREEN");
        public final static Property Blue = new Property(3, int.class, "blue", false, "BLUE");
    }


    public CategoryColorDao(DaoConfig config) {
        super(config);
    }
    
    public CategoryColorDao(DaoConfig config, DaoSession daoSession) {
        super(config, daoSession);
    }

    /** Creates the underlying database table. */
    public static void createTable(Database db, boolean ifNotExists) {
        String constraint = ifNotExists? "IF NOT EXISTS ": "";
        db.execSQL("CREATE TABLE " + constraint + "\"CATEGORY_COLOR\" (" + //
                "\"_id\" INTEGER PRIMARY KEY AUTOINCREMENT ," + // 0: id
                "\"RED\" INTEGER NOT NULL ," + // 1: red
                "\"GREEN\" INTEGER NOT NULL ," + // 2: green
                "\"BLUE\" INTEGER NOT NULL );"); // 3: blue
    }

    /** Drops the underlying database table. */
    public static void dropTable(Database db, boolean ifExists) {
        String sql = "DROP TABLE " + (ifExists ? "IF EXISTS " : "") + "\"CATEGORY_COLOR\"";
        db.execSQL(sql);
    }

    @Override
    protected final void bindValues(DatabaseStatement stmt, CategoryColor entity) {
        stmt.clearBindings();
 
        Long id = entity.getId();
        if (id != null) {
            stmt.bindLong(1, id);
        }
        stmt.bindLong(2, entity.getRed());
        stmt.bindLong(3, entity.getGreen());
        stmt.bindLong(4, entity.getBlue());
    }

    @Override
    protected final void bindValues(SQLiteStatement stmt, CategoryColor entity) {
        stmt.clearBindings();
 
        Long id = entity.getId();
        if (id != null) {
            stmt.bindLong(1, id);
        }
        stmt.bindLong(2, entity.getRed());
        stmt.bindLong(3, entity.getGreen());
        stmt.bindLong(4, entity.getBlue());
    }

    @Override
    public Long readKey(Cursor cursor, int offset) {
        return cursor.isNull(offset + 0) ? null : cursor.getLong(offset + 0);
    }    

    @Override
    public CategoryColor readEntity(Cursor cursor, int offset) {
        CategoryColor entity = new CategoryColor( //
            cursor.isNull(offset + 0) ? null : cursor.getLong(offset + 0), // id
            cursor.getInt(offset + 1), // red
            cursor.getInt(offset + 2), // green
            cursor.getInt(offset + 3) // blue
        );
        return entity;
    }
     
    @Override
    public void readEntity(Cursor cursor, CategoryColor entity, int offset) {
        entity.setId(cursor.isNull(offset + 0) ? null : cursor.getLong(offset + 0));
        entity.setRed(cursor.getInt(offset + 1));
        entity.setGreen(cursor.getInt(offset + 2));
        entity.setBlue(cursor.getInt(offset + 3));
     }
    
    @Override
    protected final Long updateKeyAfterInsert(CategoryColor entity, long rowId) {
        entity.setId(rowId);
        return rowId;
    }
    
    @Override
    public Long getKey(CategoryColor entity) {
        if(entity != null) {
            return entity.getId();
        } else {
            return null;
        }
    }

    @Override
    public boolean hasKey(CategoryColor entity) {
        return entity.getId() != null;
    }

    @Override
    protected final boolean isEntityUpdateable() {
        return true;
    }
    
}