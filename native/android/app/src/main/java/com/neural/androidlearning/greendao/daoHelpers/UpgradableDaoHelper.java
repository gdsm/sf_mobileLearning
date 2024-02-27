package com.neural.androidlearning.greendao.daoHelpers;

import android.content.Context;

import com.neural.androidlearning.greendao.daoHelpers.migrations.IDBMigration;
import com.neural.androidlearning.greendao.daoHelpers.migrations.MigrationV1ToV2;
import android.database.sqlite.SQLiteDatabase;
import com.neural.androidlearning.greendao.entities.generated.DaoMaster;

import org.greenrobot.greendao.database.Database;

public class UpgradableDaoHelper extends DaoMaster.OpenHelper {

    private Context appContext;

    public UpgradableDaoHelper(Context context, String name) {
        super(context, name);
        this.appContext = appContext;
    }

    public UpgradableDaoHelper(Context appContext, String name, SQLiteDatabase.CursorFactory factory) {
        super(appContext, name, factory);
        this.appContext = appContext;
    }

    @Override
    public void onUpgrade(Database db, int oldVersion, int newVersion) {
        super.onUpgrade(db, oldVersion, newVersion);

        IDBMigration migration = null;
        if ((oldVersion == 1) && (newVersion == 2)) {
            migration = new MigrationV1ToV2();
        }

        if (migration != null) {
            migration.applyMigration(db, oldVersion);
        }
    }
}
