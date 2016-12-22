package com.dmsv.serviceImp;

import org.apache.commons.beanutils.BeanUtils;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import com.dmsv.configurations.HibernateConfigurations;
import com.dmsv.core.UserRegisterVO;
import com.dmsv.dao.UserRegistration;
import com.dmsv.service.UserService;
@Service("userService")
public class UserServiceImp extends HibernateConfigurations implements UserService {

	
	public int saveUserRegistration(UserRegisterVO userRegisterVO)throws Exception{
		try {
			Session session = getSessionFactory().openSession();
			UserRegistration userRegistration=new UserRegistration();
			BeanUtils.copyProperties(userRegistration, userRegisterVO);
			session.beginTransaction();
			session.save(userRegistration);
			session.getTransaction().commit();
			session.close();
			System.out.println("Successfully created " + userRegisterVO.toString());

		} catch (Exception e) {
			throw e;
		}
		return 0;
	}
}