package com.sz.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sz.Pojo.Admin;
import com.sz.Service.AdminService;

@Controller
public class adminController {
	@Resource
	private AdminService adminServiceImpl;
	
	@RequestMapping("Login")
	public String login(String id , String password ,HttpSession session) {
		Admin admin = new Admin();
		admin.setAdminName(id);
		admin = adminServiceImpl.Login(admin);
		if(admin == null) {
			return "error";
		} else if(admin.getPassword().equals(password)) {
			session.setAttribute("admin", admin);
			return "main";
		}else {
			return "error";
		}
		
	}
	
}
