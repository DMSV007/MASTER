package com.dmsv.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.dmsv.core.UserLoginVO;
import com.dmsv.core.UserRegisterVO;
import com.dmsv.service.UserService;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@Controller
public class ServiceController {
	
	@Autowired
	private UserService userService;

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
		UserRegisterVO loginResponse=new UserRegisterVO();
		try {
			Map<String, String[]> parameters = request.getParameterMap();
			for(String jsonValue : parameters.keySet()) {
				Gson gson=new Gson();
				UserRegisterVO login=gson.fromJson(jsonValue,new TypeToken<UserRegisterVO>(){}.getType());
				System.out.println("Register--->"+login.getUsername());
				System.out.println("Register-->"+login.getPassword());
				if(login.getUsername()!=null){
					loginResponse.setMessage("Registration SuccessFul");
					loginResponse.setReDirectPath("index.jsp");
				}else{
					loginResponse.setMessage("Registration Failed");
					loginResponse.setReDirectPath("register.jsp");
				}
			}
		} catch (Exception e) {
			loginResponse.setReDirectPath("register.jsp");
			e.printStackTrace();
		}
		return loginResponse;
	}
}

