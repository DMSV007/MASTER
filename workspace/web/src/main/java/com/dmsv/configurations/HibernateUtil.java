package com.dmsv.configurations;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import com.dmsv.dao.UserRegistration;


public class HibernateUtil {

	public static SessionFactory getSessionFactory(String className) {
		SessionFactory sessionFactory=null;
		try {
			Configuration configuration = new Configuration().configure();
			configuration.addAnnotatedClass(Class.forName(className));
			StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder()
					.applySettings(configuration.getProperties());
			sessionFactory = configuration.buildSessionFactory(builder.build());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sessionFactory;
	}
	

}
