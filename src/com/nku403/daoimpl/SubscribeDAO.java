package com.nku403.daoimpl;

import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.nku403.entity.Subscribe;
import com.nku403.entity.SubscribeId;

/**
 * A data access object (DAO) providing persistence and search support for
 * Subscribe entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.nku403.entity.Subscribe
 * @author MyEclipse Persistence Tools
 */

public class SubscribeDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(SubscribeDAO.class);
	// property constants
	public static final String STETE = "stete";

	protected void initDao() {
		// do nothing
	}

	public void save(Subscribe transientInstance) {
		log.debug("saving Subscribe instance");
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

	public void delete(Subscribe persistentInstance) {
		log.debug("deleting Subscribe instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Subscribe findById(com.nku403.entity.SubscribeId id) {
		log.debug("getting Subscribe instance with id: " + id);
		try {
			Subscribe instance = (Subscribe) getHibernateTemplate().get(
					"com.nku403.entity.Subscribe", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Subscribe instance) {
		log.debug("finding Subscribe instance by example");
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
		log.debug("finding Subscribe instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Subscribe as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByStete(Object stete) {
		return findByProperty(STETE, stete);
	}

	public List findAll() {
		log.debug("finding all Subscribe instances");
		try {
			String queryString = "from Subscribe";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Subscribe merge(Subscribe detachedInstance) {
		log.debug("merging Subscribe instance");
		try {
			Subscribe result = (Subscribe) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Subscribe instance) {
		log.debug("attaching dirty Subscribe instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Subscribe instance) {
		log.debug("attaching clean Subscribe instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static SubscribeDAO getFromApplicationContext(ApplicationContext ctx) {
		return (SubscribeDAO) ctx.getBean("SubscribeDAO");
	}
}