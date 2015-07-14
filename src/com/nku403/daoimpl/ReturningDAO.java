package com.nku403.daoimpl;

import java.util.Date;
import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.nku403.entity.Returning;
import com.nku403.entity.ReturningId;

/**
 * A data access object (DAO) providing persistence and search support for
 * Returning entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.nku403.entity.Returning
 * @author MyEclipse Persistence Tools
 */

public class ReturningDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(ReturningDAO.class);

	// property constants

	protected void initDao() {
		// do nothing
	}

	public void save(Returning transientInstance) {
		log.debug("saving Returning instance");
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

	public void delete(Returning persistentInstance) {
		log.debug("deleting Returning instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Returning findById(com.nku403.entity.ReturningId id) {
		log.debug("getting Returning instance with id: " + id);
		try {
			Returning instance = (Returning) getHibernateTemplate().get(
					"com.nku403.entity.Returning", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Returning instance) {
		log.debug("finding Returning instance by example");
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
		log.debug("finding Returning instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Returning as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all Returning instances");
		try {
			String queryString = "from Returning";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Returning merge(Returning detachedInstance) {
		log.debug("merging Returning instance");
		try {
			Returning result = (Returning) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Returning instance) {
		log.debug("attaching dirty Returning instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Returning instance) {
		log.debug("attaching clean Returning instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ReturningDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ReturningDAO) ctx.getBean("ReturningDAO");
	}
}