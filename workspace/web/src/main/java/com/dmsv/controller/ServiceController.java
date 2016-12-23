package com.dmsv.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.dmsv.core.ModuleConfigVO;
import com.dmsv.core.UserLoginVO;
import com.dmsv.core.UserRegisterVO;
import com.dmsv.service.ModuleService;
import com.dmsv.service.UserService;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@Controller
public class ServiceController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private ModuleService moduleService;

	@RequestMapping(value="/login",method=RequestMethod.POST)
	public @ResponseBody Object login(HttpServletRequest request){
		UserLoginVO loginResponse=new UserLoginVO();
		try {
			Map<String, String[]> parameters = request.getParameterMap();
			for(String jsonValue : parameters.keySet()) {
				Gson gson=new Gson();
				UserLoginVO login=gson.fromJson(jsonValue,new TypeToken<UserLoginVO>(){}.getType());
				System.out.println("--->"+login.getUsername());
				System.out.println("-->"+login.getPassword());
				if(login.getUsername()!=null){
					loginResponse.setMessage("Login SuccessFul");
					loginResponse.setReDirectPath("MainMenu.jsp");
				}else{
					loginResponse.setMessage("Login Failed");
					loginResponse.setReDirectPath("index.jsp");
				}
			}
		} catch (Exception e) {
			loginResponse.setReDirectPath("index.jsp");
			e.printStackTrace();
		}
		return loginResponse;
	}
	
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public @ResponseBody Object register(HttpServletRequest request){
		UserRegisterVO userRegisterVO=new UserRegisterVO();
		try {
			Map<String, String[]> parameters = request.getParameterMap();
			for(String jsonValue : parameters.keySet()) {
				Gson gson=new Gson();
				userRegisterVO=gson.fromJson(jsonValue,new TypeToken<UserRegisterVO>(){}.getType());
				System.out.println("Register--->"+userRegisterVO.getEmailId());
				System.out.println("Register-->"+userRegisterVO.getMobileNo());
				userService.saveUserRegistration(userRegisterVO);
				userRegisterVO.setMessage("Registration Success");
				userRegisterVO.setReDirectPath("index.jsp");
			}
		} catch (Exception e) {
			userRegisterVO.setMessage("Registration Failed");
			userRegisterVO.setReDirectPath("register.jsp");
			e.printStackTrace();
		}
		return userRegisterVO;
	}
	
	@RequestMapping(value="/moduleConfig",method=RequestMethod.POST)
	public @ResponseBody Object moduleConfig(HttpServletRequest request){
		ModuleConfigVO moduleConfigVO=new ModuleConfigVO();
		try {
			Map<String, String[]> parameters = request.getParameterMap();
			for(String jsonValue : parameters.keySet()) {
				Gson gson=new Gson();
				moduleConfigVO=gson.fromJson(jsonValue,new TypeToken<ModuleConfigVO>(){}.getType());
				System.out.println("Module--->"+moduleConfigVO.getModuleName());
				System.out.println("Module-->"+moduleConfigVO.getModuleId());
				moduleService.saveModuleConfig(moduleConfigVO);
				moduleConfigVO.setMessage("Record Added!!");
				//moduleConfigVO.setReDirectPath("index.jsp");
			}
		} catch (Exception e) {
			moduleConfigVO.setMessage("Adding Record Failed Failed");
			//moduleConfigVO.setReDirectPath("register.jsp");
			e.printStackTrace();
		}
		return moduleConfigVO;
	}
}

