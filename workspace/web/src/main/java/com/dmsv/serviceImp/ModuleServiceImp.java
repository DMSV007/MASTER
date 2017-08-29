package com.dmsv.serviceImp;

import org.apache.commons.beanutils.BeanUtils;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import com.dmsv.configurations.HibernateUtil;
import com.dmsv.core.ModuleConfigVO;
import com.dmsv.dao.ModuleConfig;
import com.dmsv.service.ModuleService;

@Service("moduleService")
public class ModuleServiceImp extends HibernateUtil implements ModuleService{
	
	
	public int saveModuleConfig(ModuleConfigVO moduleConfigVO)throws Exception{
		try {
			ModuleConfig moduleConfig=new ModuleConfig();
			Session session = getSessionFactory(ModuleConfig.class.getName()).openSession();
			System.out.println("session ---->"+session);
			BeanUtils.copyProperties(moduleConfig, moduleConfigVO);
			System.out.println("tttttt ---->"+moduleConfig.getModuleName());
			session.beginTransaction();
			session.save(moduleConfig);
			System.out.println("saved ---->"+session);
			session.getTransaction().commit();
			session.close();
			System.out.println("Successfully created " + moduleConfig.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
}
