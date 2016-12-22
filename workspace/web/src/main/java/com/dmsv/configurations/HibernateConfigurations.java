package com.dmsv.configurations;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import com.dmsv.dao.UserRegistration;

public class HibernateConfigurations {

	public static SessionFactory getSessionFactory() {
		SessionFactory sessionFactory=null;
		try {

			Configuration configuration = new Configuration().configure();
			StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder()
					.applySettings(configuration.getProperties());
			sessionFactory = configuration.buildSessionFactory(builder.build());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sessionFactory;
	}

	public static void create(Object object) {
		try {
			Session session = getSessionFactory().openSession();
			session.save(object);
			session.close();
			System.out.println("Successfully created " + object.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


}
