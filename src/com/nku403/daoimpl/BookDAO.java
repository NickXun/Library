package com.nku403.daoimpl;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.nku403.entity.Book;

/**
 * A data access object (DAO) providing persistence and search support for Book
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.nku403.entity.Book
 * @author MyEclipse Persistence Tools
 */

public class BookDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(BookDAO.class);
	// property constants
	public static final String BOOK_NAME = "bookName";
	public static final String BOOK_AUTHOR = "bookAuthor";
	public static final String BOOK_PRESS = "bookPress";
	public static final String BOOK_PRESS_TIME = "bookPressTime";
	public static final String BOOK_ISBN = "bookIsbn";
	public static final String BOOK_PICTURE = "bookPicture";
	public static final String BOOK_INFO = "bookInfo";
	public static final String BOOK_FIND_NUMBER = "bookFindNumber";
	public static final String BOOK_TOTAL_AMOUNT = "bookTotalAmount";
	public static final String BOOK_ACCESS_AMOUNT = "bookAccessAmount";
	public static final String BOOK_HISTORY = "bookHistory";

	protected void initDao() {
		// do nothing
	}

	public void save(Book transientInstance) {
		log.debug("saving Book instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Book persistentInstance) {
		log.debug("deleting Book instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Book findById(java.lang.Integer id) {
		log.debug("getting Book instance with id: " + id);
		try {
			Book instance = (Book) getHibernateTemplate().get(
					"com.nku403.entity.Book", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Book instance) {
		log.debug("finding Book instance by example");
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
		log.debug("finding Book instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Book as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public List findSpecialBooks(String propertyName, Object value){
		log.debug("finding Book instance with property: " + propertyName
				+ ", value: " + value);
		System.out.println("1"+propertyName+"¸£"+value);
		try {
			String queryString = "from Book as model where model."
					+ propertyName + " like '%"+value+"%'";
			System.out.println(queryString);
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public List findByHotBook(){
		try {
			String queryString = "from Book as model where model.bookHistory > 0 order by model.bookHistory desc";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setFirstResult(0);
			queryObject.setMaxResults(8);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByBookName(Object bookName) {
		return findByProperty(BOOK_NAME, bookName);
	}

	public List findByBookAuthor(Object bookAuthor) {
		return findByProperty(BOOK_AUTHOR, bookAuthor);
	}

	public List findByBookPress(Object bookPress) {
		return findByProperty(BOOK_PRESS, bookPress);
	}

	public List findByBookPressTime(Object bookPressTime) {
		return findByProperty(BOOK_PRESS_TIME, bookPressTime);
	}

	public List findByBookIsbn(Object bookIsbn) {
		return findByProperty(BOOK_ISBN, bookIsbn);
	}

	public List findByBookPicture(Object bookPicture) {
		return findByProperty(BOOK_PICTURE, bookPicture);
	}

	public List findByBookInfo(Object bookInfo) {
		return findByProperty(BOOK_INFO, bookInfo);
	}

	public List findByBookFindNumber(Object bookFindNumber) {
		return findByProperty(BOOK_FIND_NUMBER, bookFindNumber);
	}

	public List findByBookTotalAmount(Object bookTotalAmount) {
		return findByProperty(BOOK_TOTAL_AMOUNT, bookTotalAmount);
	}

	public List findByBookAccessAmount(Object bookAccessAmount) {
		return findByProperty(BOOK_ACCESS_AMOUNT, bookAccessAmount);
	}

	public List findByBookHistory(Object bookHistory) {
		return findByProperty(BOOK_HISTORY, bookHistory);
	}

	public List findAll() {
		log.debug("finding all Book instances");
		try {
			String queryString = "from Book";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Book merge(Book detachedInstance) {
		log.debug("merging Book instance");
		try {
			Book result = (Book) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Book instance) {
		log.debug("attaching dirty Book instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Book instance) {
		log.debug("attaching clean Book instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static BookDAO getFromApplicationContext(ApplicationContext ctx) {
		return (BookDAO) ctx.getBean("BookDAO");
	}
}