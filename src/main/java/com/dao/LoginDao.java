package com.dao;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.Model.LoginInfo;

@Component
public class LoginDao {

	@Autowired
	HibernateTemplate hibernateTemplate;

	@Transactional
	public int saveUser(LoginInfo info) {
		Integer i = (Integer) this.hibernateTemplate.save(info);
		return i;

	}

	public List<LoginInfo> getAll() {
		List<LoginInfo> infos = this.hibernateTemplate.loadAll(LoginInfo.class);
		return infos;
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Resource(name = "mySession")
	protected SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	protected Session getSession() {
		return sessionFactory.openSession();
	}


	public boolean checkLogin(String username, String password) {
		
		System.out.println("In Check login");
		
		Session session = sessionFactory.openSession();
		
		boolean userFound = false;
		
		// Query using Hibernate Query Language
		String SQL_QUERY = " from LoginInfo as o where o.username=:username and o.password=:password";
		
		@SuppressWarnings("unchecked")
		Query<LoginInfo> query = session.createQuery(SQL_QUERY);
		query.setParameter("username", username);
		query.setParameter("password", password);

		List<LoginInfo> list = query.list();
			
			if ((list != null) && (list.size() > 0)) {
				userFound = true;
			}
		
		session.close();

		return userFound;
	}
}
