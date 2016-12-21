package com.dmsv.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.dmsv.service.Service;
import com.dmsv.vo.LoginVo;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@Controller
public class ServiceController {
	
	@Autowired
	private Service service;

	@RequestMapping(value="/login",method=RequestMethod.POST)
	public @ResponseBody Object login(HttpServletRequest request){
		LoginVo loginResponse=new LoginVo();
		try {
			Map<String, String[]> parameters = request.getParameterMap();
			for(String jsonValue : parameters.keySet()) {
				Gson gson=new Gson();
				LoginVo login=gson.fromJson(jsonValue,new TypeToken<LoginVo>(){}.getType());
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
}

