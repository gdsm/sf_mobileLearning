package com.neural.androidlearning.greendao.entities;

import androidx.annotation.Nullable;

import org.greenrobot.greendao.annotation.Entity;
import org.greenrobot.greendao.annotation.Id;
import org.greenrobot.greendao.annotation.JoinProperty;
import org.greenrobot.greendao.annotation.NotNull;
import org.greenrobot.greendao.annotation.Generated;
import org.greenrobot.greendao.annotation.OrderBy;
import org.greenrobot.greendao.annotation.ToMany;
import org.greenrobot.greendao.annotation.ToOne;

import org.greenrobot.greendao.DaoException;
import com.neural.androidlearning.greendao.entities.generated.DaoSession;
import com.neural.androidlearning.greendao.entities.generated.CategoryColorDao;
import com.neural.androidlearning.greendao.entities.generated.CategoryDao;

import java.util.List;
import com.neural.androidlearning.greendao.entities.generated.SubCategoryDao;


@Entity
public class Category {

    @Id
    public long id;

    @NotNull
    public String name;

    @Nullable
    public long colorId;

    @Nullable
    @ToOne(joinProperty = "colorId")
    public CategoryColor color;

    @NotNull
    @ToMany(referencedJoinProperty = "parentCategoryId")
    @OrderBy("id ASC")
    private List<SubCategory> subCategories;

    /** Used to resolve relations */
    @Generated(hash = 2040040024)
    private transient DaoSession daoSession;

    /** Used for active entity operations. */
    @Generated(hash = 40161530)
    private transient CategoryDao myDao;

    @Generated(hash = 2062663027)
    private transient Long color__resolvedKey;

    @Generated(hash = 1150634039)
    public Category() {
    }

    @Generated(hash = 1099531542)
    public Category(long id, @NotNull String name, long colorId) {
        this.id = id;
        this.name = name;
        this.colorId = colorId;
    }

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getColorId() {
        return this.colorId;
    }

    public void setColorId(Long colorId) {
        this.colorId = colorId;
    }

    /** To-one relationship, resolved on first access. */
    @Generated(hash = 1826887463)
    public CategoryColor getColor() {
        long __key = this.colorId;
        if (color__resolvedKey == null || !color__resolvedKey.equals(__key)) {
            final DaoSession daoSession = this.daoSession;
            if (daoSession == null) {
                throw new DaoException("Entity is detached from DAO context");
            }
            CategoryColorDao targetDao = daoSession.getCategoryColorDao();
            CategoryColor colorNew = targetDao.load(__key);
            synchronized (this) {
                color = colorNew;
                color__resolvedKey = __key;
            }
        }
        return color;
    }

    /** called by internal mechanisms, do not call yourself. */
    @Generated(hash = 203492819)
    public void setColor(@NotNull CategoryColor color) {
        if (color == null) {
            throw new DaoException(
                    "To-one property 'colorId' has not-null constraint; cannot set to-one to null");
        }
        synchronized (this) {
            this.color = color;
            colorId = color.getId();
            color__resolvedKey = colorId;
        }
    }

    /**
     * Convenient call for {@link org.greenrobot.greendao.AbstractDao#delete(Object)}.
     * Entity must attached to an entity context.
     */
    @Generated(hash = 128553479)
    public void delete() {
        if (myDao == null) {
            throw new DaoException("Entity is detached from DAO context");
        }
        myDao.delete(this);
    }

    /**
     * Convenient call for {@link org.greenrobot.greendao.AbstractDao#refresh(Object)}.
     * Entity must attached to an entity context.
     */
    @Generated(hash = 1942392019)
    public void refresh() {
        if (myDao == null) {
            throw new DaoException("Entity is detached from DAO context");
        }
        myDao.refresh(this);
    }

    /**
     * Convenient call for {@link org.greenrobot.greendao.AbstractDao#update(Object)}.
     * Entity must attached to an entity context.
     */
    @Generated(hash = 713229351)
    public void update() {
        if (myDao == null) {
            throw new DaoException("Entity is detached from DAO context");
        }
        myDao.update(this);
    }

    /** called by internal mechanisms, do not call yourself. */
    @Generated(hash = 503476761)
    public void __setDaoSession(DaoSession daoSession) {
        this.daoSession = daoSession;
        myDao = daoSession != null ? daoSession.getCategoryDao() : null;
    }

    /**
     * To-many relationship, resolved on first access (and after reset).
     * Changes to to-many relations are not persisted, make changes to the target entity.
     */
    @Generated(hash = 239672464)
    public List<SubCategory> getSubCategories() {
        if (subCategories == null) {
            final DaoSession daoSession = this.daoSession;
            if (daoSession == null) {
                throw new DaoException("Entity is detached from DAO context");
            }
            SubCategoryDao targetDao = daoSession.getSubCategoryDao();
            List<SubCategory> subCategoriesNew = targetDao._queryCategory_SubCategories(id);
            synchronized (this) {
                if (subCategories == null) {
                    subCategories = subCategoriesNew;
                }
            }
        }
        return subCategories;
    }

    /** Resets a to-many relationship, making the next get call to query for a fresh result. */
    @Generated(hash = 832942771)
    public synchronized void resetSubCategories() {
        subCategories = null;
    }

    public void setId(long id) {
        this.id = id;
    }

    public void setColorId(long colorId) {
        this.colorId = colorId;
    }
}
