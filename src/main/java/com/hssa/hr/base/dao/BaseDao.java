package com.hssa.hr.base.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public abstract class BaseDao {
	
	 @Autowired
	    private SessionFactory sessionFactory;
	 
	    protected Session getSession() {
	        return sessionFactory.getCurrentSession();
	    }
	 
	    public void save(Object entity) {
	        getSession().save(entity);
	    }
	    
	    public void update(Object entity) {
	    	getSession().update(entity);
	    }
	 
	    public void delete(Object entity) {
	        getSession().delete(entity);
	    } 	

}
