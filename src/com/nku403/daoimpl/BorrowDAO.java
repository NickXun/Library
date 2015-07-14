package com.nku403.daoimpl;

import java.util.Date;
import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.nku403.entity.Borrow;
import com.nku403.entity.BorrowId;

/**
 * A data access object (DAO) providing persistence and search support for
 * Borrow entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.nku403.entity.Borrow
 * @author MyEclipse Persistence Tools
 */

public class BorrowDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(BorrowDAO.class);
	// property constants
	public static final String IS_LATE = "isLate";
	public static final String IS_AGAIN_BOR = "isAgainBor";

	protected void initDao() {
		// do nothing
	}

	public void save(Borrow transientInstance) {
		log.debug("saving Borrow instance");
		Transaction tran=getSession().beginTransaction();
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
		tran.commit();
		getSession().flush(); 
        getSession().close();
	}

	public void delete(Borrow persistentInstance) {
		log.debug("deleting Borrow instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Borrow findById(com.nku403.entity.BorrowId id) {
		log.debug("getting Borrow instance with id: " + id);
		try {
			Borrow instance = (Borrow) getHibernateTemplate().get(
					"com.nku403.entity.Borrow", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Borrow instance) {
		log.debug("finding Borrow instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Borrow instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Borrow as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByIsLate(Object isLate) {
		return findByProperty(IS_LATE, isLate);
	}

	public List findByIsAgainBor(Object isAgainBor) {
		return findByProperty(IS_AGAIN_BOR, isAgainBor);
	}

	public List findAll() {
		log.debug("finding all Borrow instances");
		try {
			String queryString = "from Borrow";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Borrow merge(Borrow detachedInstance) {
		log.debug("merging Borrow instance");
		try {
			Borrow result = (Borrow) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Borrow instance) {
		log.debug("attaching dirty Borrow instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Borrow instance) {
		log.debug("attaching clean Borrow instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static BorrowDAO getFromApplicationContext(ApplicationContext ctx) {
		return (BorrowDAO) ctx.getBean("BorrowDAO");
	}
}